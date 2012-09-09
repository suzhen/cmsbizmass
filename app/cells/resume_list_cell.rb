class ResumeListCell < Cell::Rails

  def display(params)
    @resumes=Resume.all
    render
  end

end
