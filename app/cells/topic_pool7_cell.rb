class TopicPool7Cell < CommonCell
  def display(params)
    @name=params[:name]
    @link=params[:link]
    @ename=params[:ename]
    @rendercell=params[:rendercell]
    @display=params[:display]
    render
  end


end
