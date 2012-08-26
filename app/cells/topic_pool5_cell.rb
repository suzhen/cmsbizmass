class TopicPool5Cell < Cell::Rails

  def display()
    @category=Category.find_by_symbol($pageconfig["home_page"]["tpE"])
    @topics=@category.articles
    render
  end

end
