class CarouselCell < Cell::Rails

  def display
    @magazines=Magazine.all
    render
  end

end
