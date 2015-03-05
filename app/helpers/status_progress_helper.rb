module StatusProgressHelper
  def status_progress(boolean, string)
    if boolean
      return "<li class='status true'> #{string} <i class='fa fa-check'></i> </li>".html_safe
    else
      return "<li class='status'> #{string} </li>".html_safe.html_safe
    end 
  end
end