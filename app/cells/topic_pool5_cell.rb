class TopicPool5Cell < CommonCell

  def display()
    @category=Category.find_by_symbol($configroot["homepages"]["tpE"]["symbol"])
    @topics=@category.articles
    render
  end

end
