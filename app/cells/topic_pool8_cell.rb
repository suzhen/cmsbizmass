class TopicPool8Cell < CommonCell

  def display(params)
    @article=Article.find params[:id]
    @article.hits+=1
    @article.save
    render
  end

end
