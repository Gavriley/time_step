module ApplicationHelper

  def flash_message
    if flash[:notice]
      content_tag(:div, flash[:notice], class: 'alert alert-success')
    elsif flash[:error]
      content_tag(:div, flash[:error], class: 'alert alert-danger')
    elsif flash[:alert]
      content_tag(:div, flash[:alert], class: 'alert alert-warning')
    end
  end

end
