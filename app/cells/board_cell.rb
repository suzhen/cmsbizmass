class BoardCell < Cell::Rails

  def display(params)
    @article=Article.find params[:aid]
    @article.hits+=1
    @article.save
    render
  end

end
