class MagazinesCell < Cell::Rails

  def display
    @magazines=Magazine.limit(6)
    render
  end

end
