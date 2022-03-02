class GameOfLife
  def get_next_grid(current_grid)
    new_grid = current_grid

    new_grid.each do |row|
      row.each do |cell|
        living_neighbours_count = living_neighbours_count(cell, new_grid)
        new_state_of_cell(cell, living_neighbours_count)
      end
    end
  end

  def new_state_of_cell(cell, living_neighbours_count)
    cell
  end

  def living_neighbours_count(cell, grid)
    0
  end
end
