class ArticleTopCell < Cell::Rails

  def display(params)
    @topics=Article.order("hits DESC").limit(params["limit"].to_i)

    render
  end

end
