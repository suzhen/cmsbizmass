class BizListCell < Cell::Rails

  def display(params)
    limit_symbol = params["limit"]
    @hotbizs=BizCompany.limit(limit_symbol.to_i)
    render
  end

end
