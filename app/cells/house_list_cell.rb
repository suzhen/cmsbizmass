class HouseListCell < Cell::Rails

  def display(params)
    limit = params[:limit] 
    @houses=House.limit(limit)
    render
  end

end
