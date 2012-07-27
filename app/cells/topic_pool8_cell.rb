class TopicPool8Cell < Cell::Rails

  def display(params)
    @article=Article.find params[:id]
    render
  end

end
