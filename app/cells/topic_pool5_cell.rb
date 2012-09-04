class TopicPool5Cell < CommonCell

  def display()
    @topics=Article.reorder(:hits).limit(6)
    render
  end

end
