class TopicPool5Cell < Cell::Rails

  def display(params)
    @topics=params[:topics]
    render
  end

end
