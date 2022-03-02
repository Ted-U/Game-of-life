class GameOfLife
  def get_next_grid(current_grid)
    new_grid = current_grid

    new_grid.each do |row|
      row.each do |cell|
        # living_neighbours_count(cell, new_grid)
        living_neighbours_count = 0
        new_state_of_cell(cell, living_neighbours_count)
      end
    end
  end

  def new_state_of_cell(cell, living_neighbours_count)
    cell
  end
end
