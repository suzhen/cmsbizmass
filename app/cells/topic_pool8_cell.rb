class TopicPool8Cell < CommonCell

  def display(params)
    @article=Article.find params[:id]
    render
  end

end
