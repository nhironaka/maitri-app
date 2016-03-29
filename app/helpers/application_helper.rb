require 'net/http'
require 'uri'
module ApplicationHelper
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, patients_overview_path({:sort => column, :direction => direction}), {:class => css_class}
  end
  
  def is_user_path
    !(request.original_url =~ /\/users/).nil?
  end
end
