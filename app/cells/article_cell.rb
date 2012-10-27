class ArticleCell < CommonCell

  def display(params)
    category_symbol = params["category"]
    @symbol=params[:symbol]
    arr_symbol=@symbol.split(":")
    @character = $configroot[arr_symbol[0]][arr_symbol[1]]["character"]
    category = Category.find_by_symbol(category_symbol)
    @article=category.articles.order("listorder,updated_at DESC").first
    render
  end


end
