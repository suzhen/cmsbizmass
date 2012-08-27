class TopicPool4Cell < Cell::Rails

  def display(params)
    @symbol=params[:symbol]
    @category=Category.find_by_symbol($pageconfig["home_page"][@symbol])
    @topics=@category.articles

    render
  end

end
