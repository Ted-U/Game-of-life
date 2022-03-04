class GameOfLife
  def get_next_grid(current_grid)
    new_grid = current_grid

    new_grid.map.with_index do |row, row_index|
      row.map.with_index do |cell, column_index|
        living_neighbours_count = number_of_living_neighbours(row_index, column_index, new_grid)
        new_state_of_cell(cell, living_neighbours_count)
      end
    end
  end

  # living_neighbours_count from line 7
  def new_state_of_cell(cell, living_neighbours_count) 
    
    # if dead
    if cell == :dead && living_neighbours_count == 3
      return :live
    elsif cell == :live && living_neighbours_count == 3
      return :live

    # if live
    elsif cell == :live && living_neighbours_count < 2
      return :dead
    elsif cell == :live && living_neighbours_count > 3
      return :dead
    else
      return cell
    end

    # if dead and count is 3 ---> live
    # if live and count is 2 or 3 ---> live
    # if live and count is greater than  3 ---> dead
    # if live and count is less than 2 ---> dead
  end

  def number_of_living_neighbours(cell_row_index, cell_column_index, grid)

    current_count = 0

    # left
    current_count+=1 if grid[cell_row_index][cell_column_index-1] == :live
    
    # right
    current_count+=1 if grid[cell_row_index][cell_column_index+1] == :live
      
    # above
    current_count+=1 if grid[cell_row_index-1][cell_column_index] == :live
      
    # below
    current_count+=1 if grid[cell_row_index+1] != nil && grid[cell_row_index+1][cell_column_index] == :live
  
    #diagonal top left
    current_count+=1 if grid[cell_row_index-1][cell_column_index-1] == :live

    #diagonal top right
    current_count+=1 if grid[cell_row_index-1][cell_column_index+1] == :live

    # #diagonal bottom left
    current_count+=1 if grid[cell_row_index+1] != nil && grid[cell_column_index-1] != nil && grid[cell_row_index+1][cell_column_index-1] == :live

    #diagonal bottom right
    current_count+=1 if grid[cell_row_index+1] != nil && grid[cell_column_index+1] != nil && grid[cell_row_index+1][cell_column_index+1] == :live
     
    return current_count   
  end
end
