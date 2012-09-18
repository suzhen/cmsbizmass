class AdListCell < Cell::Rails

  def display(params)
    @symbol=params[:symbol]
    arr_symbol=@symbol.split(":")
    position_symbol = $configroot[arr_symbol[0]][arr_symbol[1]][arr_symbol[2]]
    @ad_space=AdSpace.find_by_symbol(position_symbol)
    @ads=@ad_space.ads.limit(@ad_space.items)
    p @ads.count
    render
  end

end
