module VolunteersHelper
  def tick_or_cross(boolean)
    if boolean
      return "<i class='fa fa-check'></i>".html_safe
    else
      return "<i class='fa fa-times'></i>".html_safe
    end 
  end
end

