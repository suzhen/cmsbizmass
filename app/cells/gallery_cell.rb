class GalleryCell < Cell::Rails
  def display(params)
    @symbol=params[:symbol]
    @pic_space=PicSpace.find_by_symbol($pageconfig["home_page"][@symbol])
    @pictures=@pic_space.pictures #maxnum
    render
  end
end
