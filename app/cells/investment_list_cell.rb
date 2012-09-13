class InvestmentListCell < Cell::Rails

  def display(params)
    @symbol=params[:symbol]
    arr_symbol=@symbol.split(":")
    page_symbol = $configroot[arr_symbol[0]][arr_symbol[1]]
    show_limit = page_symbol["limit"]
    @investments=PropertyManagementCompany.limit(show_limit)
    render
  end

end
