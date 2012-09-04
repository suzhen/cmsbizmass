class TopicPool5Cell < CommonCell

  def display()
    @topics=Article.reverse_order(:hits).limit(6)
    render
  end

end
