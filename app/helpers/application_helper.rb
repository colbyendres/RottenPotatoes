module ApplicationHelper
  
  def sortable(column, title)
    # Reverse sort direction on click
    if column == @sort_column
      direction = @sort_direction == 'desc' ? 'asc' : 'desc'
      title += @sort_direction == 'desc' ? ' ↓' : ' ↑'
    end
    link_to title, { sort: column, direction: direction }
  end

  # Change background color of sorted column depending on direction
  def bg_color(column)
    if column != @sort_column
      return 
    end
    @sort_direction == 'desc' ? 'desc' : 'asc'
  end

end
