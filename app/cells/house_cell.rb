class HouseCell < Cell::Rails

  def display(params)
    @house = House.find params[:hid]
    render
  end

end
