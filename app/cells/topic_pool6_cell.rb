class TopicPool6Cell < Cell::Rails

  def display
   @sound=Record.find_by_category("sound")
    render
  end

end
