class VideoViewCell < CommonCell

  def display(params)
    @video=Video.show_in_primary.order_created.first
        
    render
  end

  def videolist(params)
    show_limit = params["limit"]
    @videos=Video.order_created.limit(show_limit)
    render
  end

end
