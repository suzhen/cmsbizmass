class ArticleListCell < CommonCell

  def display(params)
    @symbol=params[:symbol]
    arr_symbol=@symbol.split(":")
    page_symbol = $configroot[arr_symbol[0]][arr_symbol[1]]
    category_symbol = page_symbol["symbol"]
    show_limit = page_symbol["limit"]
    category=Category.find_by_symbol(category_symbol)
    @topics=category.articles.order("listorder,created_at DESC").limit(show_limit)
    render
  end

end
