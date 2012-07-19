class TopicPool3Cell < Cell::Rails

  def display(params)
    @name=params[:name]
    @link=params[:link]
    @ename=params[:ename]
    @topics=params[:topics]
    render
  end

end
