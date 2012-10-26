class EmployingUnitCell < Cell::Rails

  def display(params)
    limit_symbol =params["limit"]
    @employing_units=EmployingUnit.show_in_primary.limit(limit_symbol.to_i)
 
    render
  end

end
