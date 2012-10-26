#coding: utf-8

class TopicPool8Cell < CommonCell

  def display(params)
    if params[:cid].present?
      category=Category.find params[:cid] 
      @position=category.chain
    end
    if params[:aid].present?
     article=Article.find params[:aid]  
     @position=article.category_chain
    end
    if params[:hid].present?
      @position="商业地产 —> 地产项目"
    end
    if params[:iid].present?
      @position="商业地产 —> 招商项目"
    end
    if params[:eid].present?
     @position="人才招聘"
    end

    @rendercell=params[:rendercell]
    @display=params[:display]
    @arg=params.delete_if {| key, value | ["rendercell","display"].include? key  }
    @arg=params
    render
  end

end
