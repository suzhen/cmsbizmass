#coding: utf-8
class ZhaopinCell < Cell::Rails

  def display(params)
    @employing_unit = EmployingUnit.find(params[:eid])




    render
  end

end
