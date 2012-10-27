class MagazinesCell < CommonCell

  def display(params)
    shownum = params["limit"].to_i
    @magazines=Magazine.order("listorder").limit(shownum)
    render
  end

  def guidance(params)
    shownum= params["limit"].to_i
    @magazines=Magazine.order("listorder").limit(shownum)
    render
  end

end
