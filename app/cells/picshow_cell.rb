class PicshowCell < Cell::Rails

  def display(params)
    @symbol=params[:symbol]
    arr_symbol=@symbol.split(":")
    picSpace_symbol = $configroot[arr_symbol[0]][arr_symbol[1]]["picposition"]
    @picVersion = $configroot[arr_symbol[0]][arr_symbol[1]]["version"]
    @pic_space=PicSpace.find_by_symbol(picSpace_symbol)
    @pictures=@pic_space.pictures.limit(@pic_space.maxnum) 
    render
  end

end
