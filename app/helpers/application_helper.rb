module ApplicationHelper
  
  def current_class?(desired_path)
    return 'nav-link active' if request.path == desired_path
    'nav-link'
  end

end
