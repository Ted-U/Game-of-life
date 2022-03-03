class GameOfLife
  def get_next_grid(current_grid)
    new_grid = current_grid

    new_grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
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

    # grid = [
    #     [:dead, :dead,        :dead],
    #     [:dead, :target_cell, :dead],
    #     [:dead, :dead,        :dead]
    #   ]
    
    # left
    if grid[cell_row_index][cell_column_index-1] == :live
      current_count+=1

      # right
    elsif grid[cell_row_index][cell_column_index+1] == :live
      current_count+=1

      # above
    elsif grid[cell_row_index-1][cell_column_index] == :live
      current_count+=1

      # below
    elsif grid[cell_row_index+1] != nil && grid[cell_row_index+1][cell_column_index] == :live
      current_count+=1 

      #diagonal
    elsif grid[cell_row_index-1][cell_column_index-1] == :live
      current_count+=1
    else
      current_count
    end
    


    # current_grid = [
    #   [ :dead, :dead, :dead, :dead ],
    #   [ :dead, :live, :live, :dead ],
    #   [ :dead, :live, :live, :dead ],
    #   [ :dead, :dead, :dead, :dead ]
    # ]

    
    # living_neighbours_count = grid[cell_row_index+1][cell_column_index] ? alive or dead
    # living_neighbours_count.count
    # cell_row_index = 1
    # cell_column_index = 2

    # return 1

    # cell_row_index = 2
    # cell_column_index = 2

    # return 2
    # 
    
  end
end



# current_grid = 
# [
#   0[ 0:dead, 1:dead, 2:dead, 3:dead, 4:dead ],
#   1[ 0:dead, 1:dead, 2:live, 3:dead, 4:dead ],
#   2[ 0:dead, 1:dead, 2:live, 3:dead, 4:dead ],
#   3[ 0:dead, 1:dead, 2:live, 3:dead, 4:dead ],
#   4[ 0:dead, 1:dead, :2dead, 3:dead, 4:dead ]

# ]

# 
