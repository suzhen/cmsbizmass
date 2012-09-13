class TopicPool3Cell < CommonCell

  def display(params)
    @symbol=params[:symbol]
    unless @symbol.nil?
      arr_symbol=@symbol.split(":")
      page_symbol = $configroot[arr_symbol[0]][arr_symbol[1]]
      category_symbol = page_symbol["symbol"]
      unless category_symbol.blank?
        category=Category.find_by_symbol(category_symbol)
        @name=page_symbol["name"].nil? ? category.name : page_symbol["name"]
        @link=params[:link]
        @ename=page_symbol["ename"].nil? ? category.ename : page_symbol["name"] 
      end
    end
    @name= params[:name] if @name.nil?
    @ename = params[:ename] if @ename.nil?
    @link = params[:link] if @link.nil?

    @rendercell=params[:rendercell]
    @display=params[:display]
    render
  end

end
