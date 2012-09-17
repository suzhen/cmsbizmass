class VideoViewCell < CommonCell

  def display(params)
    @video=Video.show_in_primary.order_created.first
        
    render
  end

end
