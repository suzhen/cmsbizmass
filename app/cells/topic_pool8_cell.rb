class TopicPool8Cell < Cell::Rails

  def display(params)
    #@title=params[:title]
    @article=Article.first
    render
  end

end
