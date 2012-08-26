class TopicPool2Cell < Cell::Rails

  def display(params)
    @symbol=params[:symbol]
    @category=Category.find_by_symbol($pageconfig["home_page"][@symbol])
    @name=@category.name
    @link=params[:link]
    @ename=@category.ename
    @topics=@category.articles
    render
  end


end
