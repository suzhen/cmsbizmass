class CarouselCell < CommonCell

  def display(params)
    @symbol=params[:symbol]
    arr_symbol=@symbol.split(":")
    picSpace_symbol = $configroot[arr_symbol[0]][arr_symbol[1]]
    @pic_space=PicSpace.find_by_symbol(picSpace_symbol)

    @pictures=@pic_space.pictures #maxnum
    render
  end

end
