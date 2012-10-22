class InvestmentProjectCell < Cell::Rails

  def display(params)
    @investmentproject=PropertyManagementCompany.find params[:iid]
    render
  end

end
