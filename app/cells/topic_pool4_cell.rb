class TopicPool4Cell < Cell::Rails

  def display(params)
    @topics=params[:topics]
    render
  end

end
