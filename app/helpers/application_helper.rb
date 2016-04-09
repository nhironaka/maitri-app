require 'net/http'
require 'uri'
module ApplicationHelper
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, patients_overview_path({:sort => column, :direction => direction}), {:class => css_class}
  end
  
  def is_sign_in_path?
    !(request.original_url =~ /\/users\/sign_in/).nil?
  end
  
  def is_user_auth?
    !(request.original_url =~  /\/users\/password\/new/).nil?
  end
end
