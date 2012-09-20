class ArticleTopCell < Cell::Rails

  def display(params)
    @topics=Article.order("hits DESC").limit(6)

    render
  end

end
