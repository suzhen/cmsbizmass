class LinksCell < CommonCell

  def display
    @links=Link.all

    render
  end

end
