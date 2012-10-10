class ArticleCell < CommonCell

  def display(params)
    @symbol=params[:symbol]
    arr_symbol=@symbol.split(":")
    page_symbol = $configroot[arr_symbol[0]][arr_symbol[1]]
    category_symbol = page_symbol["symbol"]
    @character  = page_symbol["character"]
    category = Category.find_by_symbol(category_symbol)
    @article=category.articles.order("listorder,created_at DESC").first
    render
  end


end
