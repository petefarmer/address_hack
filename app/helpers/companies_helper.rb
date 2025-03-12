module CompaniesHelper
  def sort_indicator(column)
    return '' unless params[:sort] == column
    
    if params[:direction] == 'asc'
      '↑'
    else
      '↓'
    end
  end

  def next_sort_direction(column)
    if params[:sort] == column && params[:direction] == 'asc'
      'desc'
    else
      'asc'
    end
  end
end
