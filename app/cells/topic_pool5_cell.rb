class TopicPool5Cell < CommonCell

  def display()
    @topics=Article.order(:hits).limit(6)
    render
  end

end
