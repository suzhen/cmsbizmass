class TopicPool4Cell < CommonCell

  def display(params)
    @symbol=params[:symbol]
    @rendercell=params[:rendercell]
    @display=params[:display]
 
    render
  end

end
