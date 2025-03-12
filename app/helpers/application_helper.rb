module ApplicationHelper
  def country_options
    Address.country_options
  end

  def country_name(code)
    Address::COUNTRY_CODES[code] || code
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    icon = if column == params[:sort]
      direction == "asc" ? "↓" : "↑"
    end
    link_to [title, icon].compact.join(' ').html_safe, 
            request.params.merge(sort: column, direction: direction),
            class: "text-xs font-medium text-gray-500 uppercase tracking-wider hover:text-gray-900"
  end
end
