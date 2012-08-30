class TopicPool6Cell < CommonCell

  def display
   @sound=Record.find_by_category("sound")
    render
  end

end
