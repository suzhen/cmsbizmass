class MagazinesCell < Cell::Rails

  def display
    @magazines=Magazine.all
    render
  end

end
