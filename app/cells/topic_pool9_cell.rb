class TopicPool9Cell < CommonCell

  def display(params)
     @symbol=params[:symbol]
     unless @symbol.nil?
      arr_symbol=@symbol.split(":")
      page_symbol = $configroot[arr_symbol[0]][arr_symbol[1]]
     #分类
     category_symbol = page_symbol["symbol"]
     #标题
     name_symbol = page_symbol["name"]
     #个数
     limit_symbol = page_symbol["limit"]
     #更多
     link_symbol = page_symbol["link"]

      category=Category.find_by_symbol(category_symbol) unless category_symbol.blank?
     
     unless name_symbol.blank?
        @name = name_symbol     else
        @name = category.name unless category.nil?
     end 

     unless link_symbol.blank?
        @link = link_symbol     else
        @link = "/article_list/#{category.id.to_s}" unless category.nil?
     end 

    end
    @name= "" if @name.nil?
    @link = "" if @link.nil?
    @rendercell=params[:rendercell]
    @display=params[:display]
    p "+++++++++"
   p @rendercell
   p @display
   p @name
   p @link
   @arg=page_symbol.delete_if {| key, value | ["link","rendercell","display","name"].include? key  }
    #@arg=params
   p @arg
    render
  end

end
