class TopicPool1Cell < Cell::Rails

  def display(params)
    @name=params[:name]
    @link=params[:link]
    @rendercell=params[:rendercell]
    @display=params[:display]
    render
  end

end
