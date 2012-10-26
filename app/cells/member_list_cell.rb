class MemberListCell < Cell::Rails

  def display(params)
    limit_symbol = params["limit"]
    @members=Member.show_in_primary.limit(limit_symbol.to_i)
    render
  end

end
