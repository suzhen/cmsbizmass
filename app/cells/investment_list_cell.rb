class InvestmentListCell < Cell::Rails

  def display(params)
    show_limit = params["limit"]
    @investments=PropertyManagementCompany.limit(show_limit)
    render
  end

end
