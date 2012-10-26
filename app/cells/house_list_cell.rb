class HouseListCell < Cell::Rails

  def display(params)
    limit = params[:limit] 
    @houses=House.order("updated_at DESC").limit(limit)
    render
  end

end
