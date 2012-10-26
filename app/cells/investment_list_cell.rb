class InvestmentListCell < Cell::Rails

  def display(params)
    show_limit = params["limit"]
    @investments=PropertyManagementCompany.order("updated_at DESC").limit(show_limit)
    render
  end

end
