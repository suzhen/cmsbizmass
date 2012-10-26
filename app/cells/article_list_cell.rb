class ArticleListCell < CommonCell

  def display(params)
    category_symbol =  params["category"]
    show_limit = params["limit"]
    category=Category.find_by_symbol(category_symbol)
    @topics=nil
    @topics=category.articles.order("listorder,created_at DESC").limit(show_limit) if category.present?
    render
  end

end
