class ArticleSummaryListCell < CommonCell

  def display(params)
    category_symbol = params["category"]
    show_limit = params["limit"]
    category=Category.find_by_symbol(category_symbol)
    @topics=category.articles.order("updated_at DESC").limit(show_limit)
   p @topics 
    render
  end

end
