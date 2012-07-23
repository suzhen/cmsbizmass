class LinksCell < Cell::Rails

  def display
    @links=Link.all

    render
  end

end
