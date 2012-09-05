class TopicPool5Cell < CommonCell

  def display()
    @topics=Article.order("hits DESC").limit(6)
    render
  end

end
