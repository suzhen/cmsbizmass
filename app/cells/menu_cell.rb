class MenuCell < Cell::Rails

  def display(params)
    @controller_name=params[:controller_name]
    render
  end

  def show(params)
    @controller_name=params[:controller_name]
    @action_name=params[:action_name]
    render
  end

end
