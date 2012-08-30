class TopicPool1Cell < CommonCell

  def display(params)
    @link=params[:link]
    @symbol=params[:symbol]
    @rendercell=params[:rendercell]
    @display=params[:display]
    @arg=params
   p @arg
    render
  end

end
