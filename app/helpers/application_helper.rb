module ApplicationHelper
  
  # Generate links, where sort_column goes to the opposite direction
  def genLinks(column, title)
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
    @sort_direction
  end

end
