class RepertoryCell < Cell::Rails

  def display(params)
    category=Category.find(params[:cid])
    @articles=category.articles.order("listorder").limit(30)
    render
  end

end
