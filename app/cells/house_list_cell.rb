class HouseListCell < Cell::Rails

  def display(params)
    @symbol=params[:symbol]
    arr_symbol=@symbol.split(":")
    limit_symbol = $configroot[arr_symbol[0]][arr_symbol[1]]["limit"]
    @houses=House.limit(limit_symbol.to_i)
 
    render
  end

end