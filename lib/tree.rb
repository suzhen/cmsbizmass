module Tree
  #通过befor_save和after_save改变结点的位置信息
  #当新增一个父结点为0的结点时，跳过after_save和befor_save，直接新增。
  #当结点的arrparentid为空，该结点为新增结点


  def self.included(base)
    base.extend(ClassMethods)
    base.class_eval do
      after_save :update_parent_and_child_nodes 
      before_save :update_node
      before_destroy :destroy_child_node
      after_destroy :destroy_after_update_parent_node
    end
  end
  
  #----------类方法----------#
  module ClassMethods
      #获取一组分类的名称
      def get_node_names ids
        return "" if ids.nil?||ids==""
        names=""
        ids.split(",").each do |id|
          next if id.to_s=="0"
          cObj=self.find id
          names+=cObj.nil? ? "" : cObj.name+","
        end
        return names[0..-2]
      end

      #获取ztree数据
      def ztree_data ctype 
        znodes=""
        self.where(["ctype=?",ctype]).each do |node|
          znodes+="{ id:#{node.id}, pId:#{node.parent_id}, name:'#{node.name}', isParent:true, open:true},"
        end
        "["+znodes[0..-2]+"]"
      end

  end



  #----------实例方法-----------#
 @@arrchildids=nil
 def get_all_children_ids
      if self.arrchildid.nil?
         return
      end
      self.arrchildid.split(",").each do |id|
          self.class.find(id).get_all_children_ids
         @@arrchildids<<id
      end
  end

  #递归获取所有子类别
  def all_belongs_to_node(include_self=false)
    @@arrchildids=Array.new
    self.get_all_children_ids
    @@arrchildids
  end

  #获取分类的下一级子类
  def get_children_nodes(include_self=false)
    arr_node= self.class.where(["parent_id=?",self.id]).collect {|node| [node.id,node.name]}
    arr_node<<[self.id,self.name]  if include_self
    arr_node
  end

 #----------勾子方法-----------#
 
  #更新父结点和子结点
  def update_parent_and_child_nodes()
    puts "+after_save1+"
    return true  if @onlycontent #只修改内容
    puts "+after_save2+"

    unless self.parent_id==0
       #更新现父结点的arrchildid
       p_node=self.class.find(self.parent_id)
       if p_node.arrchildid.nil?
         p_node.arrchildid=self.id.to_s
      else
        p_node.arrchildid+=','+self.id.to_s
      end
      p_node.save
      #更新原父结点的arrchildid 
      unless @originalpnode.nil?
        original_p_node=self.class.find(@originalpnode)
        original_p_node_arr_childid=original_p_node.arrchildid.split(",").reject{|item| item.to_s==self.id.to_s}
        original_p_node.arrchildid=original_p_node_arr_childid.empty? ? nil : original_p_node_arr_childid.join(',')
        original_p_node.save
      end
    end

    #更新子结点的arrparentid
    return true if self.arrchildid.nil?
    arrallchildid=self.all_belongs_to_node.reverse
    arrallchildid.each do |childid|
      childnode=self.class.find(childid)
      p_childnode=self.class.find(childnode.parent_id)
      childnode.update_attributes(:arrparentid=>p_childnode.arrparentid+","+childnode.parent_id.to_s)
    end
    return true
  end

  #更新arrparentid
  def update_node()
    return false if self.all_belongs_to_node(true).include?(self.parent_id.to_s) #防止恶意递归
    puts "+before_save1+"
    @onlycontent=false
    @originalpnode=nil
    self.parent_id=0  if self.parent_id.blank?
    if !self.arrparentid.nil? && self.parent_id.to_s==self.arrparentid.split(",")[-1] #只修改内容
      @onlycontent=true
      return true
    end
    puts "+before_save2+"
    if self.arrparentid.nil?
      @originalpnode=nil
    else
      @originalpnode=self.arrparentid.split(",")[-1]
    end


    if self.parent_id==0 
       self.arrparentid="0"
    else
      self.arrparentid=self.class.find(self.parent_id).arrparentid+","+self.parent_id.to_s
    end
    return true
  end

  #删除所有子结点
  def destroy_child_node()
    puts "++++++++++++++++++before_destroy+++++++++++++++++" 
    self.class.delete_all "id in (#{self.all_belongs_to_node.join(",")})"  unless self.arrchildid.nil?
    return true
  end

  #删除后更新父结点
  def destroy_after_update_parent_node()
    puts "++++++++++++++++++after_destroy+++++++++++++++++" 
     unless self.parent_id==0
        p_node=self.class.find self.parent_id
        p_arrchildid=p_node.arrchildid.split(",").reject{|id| id==self.id.to_s}
        p_node.update_attribute(:arrchildid,p_arrchildid.empty? ? nil : p_arrchildid.join(","))
   end
   return true
  end

end
