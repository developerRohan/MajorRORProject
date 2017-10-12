module PostsHelper
	def status_label status
    case status
    when 'submitted'
      content_tag(:span, status.capitalize, class: 'label label-default')
    when 'approved'
      content_tag(:span, status.titleize, class: 'label label-success')
    when 'rejected'
      content_tag(:span, status.titleize, class: 'label label-danger')
      when 'pending'
        content_tag(:span, status.titleize, class: 'label label-primary')
      when 'confirmed'
        content_tag(:span, status.titleize, class: 'label label-success')
    end
  end
end
