module ApplicationHelper

  def flash_message
    if flash[:notice]
      content_tag(:div, flash[:notice], class: 'alert alert-success')
    elsif flash[:alert]
      content_tag(:div, flash[:alert], class: 'alert alert-warning')
    elsif flash[:error]
      content_tag(:div, flash[:error], class: 'alert alert-danger')
    elsif flash[:info]
      content_tag(:div, flash[:info], class: 'alert alert-info')
    end
  end

end
