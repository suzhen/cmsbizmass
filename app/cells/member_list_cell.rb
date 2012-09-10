class MemberListCell < Cell::Rails

  def display(params)
    @symbol=params[:symbol]
    arr_symbol=@symbol.split(":")
    limit_symbol = $configroot[arr_symbol[0]][arr_symbol[1]]["limit"]
    @members=Member.show_in_primary.limit(limit_symbol.to_i)
    render
  end

end
