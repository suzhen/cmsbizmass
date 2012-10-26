class MagazinesCell < CommonCell

  def display(params)
    shownum = params["limit"].to_i
    @magazines=Magazine.order("public_date").limit(shownum)
    render
  end

  def guidance(params)
    shownum= params["limit"].to_i
    @magazines=Magazine.order("public_date DESC").limit(shownum)
    render
  end

end
