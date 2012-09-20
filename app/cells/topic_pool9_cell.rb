class TopicPool9Cell < CommonCell

  def display(params)
     @symbol=params[:symbol]
     unless @symbol.nil?
      arr_symbol=@symbol.split(":")
      page_symbol = $configroot[arr_symbol[0]][arr_symbol[1]]
      category_symbol = page_symbol["symbol"]
      category=Category.find_by_symbol(category_symbol)
      @name=page_symbol["name"].nil? ? category.name : page_symbol["name"]
      @link="/article_list/#{category.id.to_s}"
      @ename=page_symbol["ename"].nil? ? category.ename : page_symbol["name"] 
     end
    @name= params[:name] if @name.nil?
    @ename = params[:ename] if @ename.nil?
    @link = params[:link] if @link.nil?

    @rendercell=params[:rendercell]
    @display=params[:display]
    @arg=params.delete_if {| key, value | ["link","rendercell","display","name"].include? key  }
    @arg=params
    render
  end

end
