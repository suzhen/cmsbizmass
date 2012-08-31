class MagazinesCell < CommonCell

  def display(params)
    shownum = params[:shownum].to_i
    @magazines=Magazine.order("public_date").limit(shownum)
    render
  end

  def guidance(params)
    shownum= params[:shownum].to_i
    @magazines=Magazine.order("public_date").limit(shownum)
    render
  end

end
