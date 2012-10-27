class LinksCell < CommonCell

  def display(params)
    @links=Link.all

    render
  end

end
