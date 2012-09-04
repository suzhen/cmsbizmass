class TopicPool5Cell < CommonCell

  def display()
    @topices=Article.order(:hits).limit(6)
    render
  end

end
