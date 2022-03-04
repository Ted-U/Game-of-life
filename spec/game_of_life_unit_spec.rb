describe GameOfLife do
  context '#new_state_of_cell' do
    context 'when cell is dead' do
      it 'stays dead if its neighbours are all dead' do
        initial_state = :dead
        living_neighbours_count = 0

        new_state = subject.new_state_of_cell(initial_state, living_neighbours_count)

        expect(new_state).to eq(:dead)
        # expect that :
        # new_state_of_cell(:dead, 0) ---> :dead
      end

      it 'stays dead if one neighbour is live' do 
        initial_state = :dead
        living_neighbours_count = 1

        new_state = subject.new_state_of_cell(initial_state, living_neighbours_count)

        expect(new_state).to eq(:dead)
        
      end

      it 'stays dead if 2 neighbours are live' do 
        initial_state = :dead
        living_neighbours_count = 2

        new_state = subject.new_state_of_cell(initial_state, living_neighbours_count)

        expect(new_state).to eq(:dead)
    
      end
      
      it 'becomes live if 3 neighbours are live' do 
        initial_state = :dead
        living_neighbours_count = 3

        new_state = subject.new_state_of_cell(initial_state, living_neighbours_count)

        expect(new_state).to eq(:live)
      end

    
    end
    context 'when cell is alive' do
      it 'stays live if 2 neighbours are live' do
      initial_state = :live
      living_neighbours_count = 2

      new_state = subject.new_state_of_cell(initial_state, living_neighbours_count)

      expect(new_state).to eq(:live)
      end

      it 'becomes dead if only 1 neighbour is live' do
        initial_state = :live
        living_neighbours_count = 1
  
        new_state = subject.new_state_of_cell(initial_state, living_neighbours_count)
  
        expect(new_state).to eq(:dead)
      end
   
    end
  end

  context '#number_of_living_neighbours' do
    it 'returns 0 given the middle cell in a dead grid' do
      target_cell = :dead

      grid = [
        [:dead, :dead,        :dead],
        [:dead, :target_cell, :dead],
        [:dead, :dead,        :dead]
      ]

      cell_row = 1
      cell_column = 1

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, grid)
      ).to eq(0)
    end
    context 'live neighbours on the same row' do
    it 'Returns 1 given the middle cell with 1 neighbour on the left' do
      target_cell = :dead

      grid = [
        [:dead, :dead,        :dead],
        [:live, :target_cell, :dead],
        [:dead, :dead,        :dead]
      ]

      cell_row = 1
      cell_column = 1

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, grid)
      ).to eq(1)
    end

    it 'Returns 1 given the middle cell with 1 neighbour on the right' do
      target_cell = :dead

      grid = [
        [:dead, :dead,        :dead],
        [:dead, :target_cell, :live],
        [:dead, :dead,        :dead]
      ]

      cell_row = 1
      cell_column = 1

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, grid)
      ).to eq(1)
    end
    context 'live neighbours in same column' do
      it 'Returns 1 given the middle cell with 1 neighbour immediately above' do
        target_cell = :dead

        grid = [
          [:dead, :live,        :dead],
          [:dead, :target_cell, :dead],
          [:dead, :dead,        :dead]
        ]

        cell_row = 1
        cell_column = 1

        expect(
          subject.number_of_living_neighbours(cell_row, cell_column, grid)
        ).to eq(1)
      end
      it 'Returns 1 given the middle cell with 1 live neighbour immediately below' do
        target_cell = :dead

        grid = [
          [:dead, :dead,        :dead],
          [:dead, :target_cell, :dead],
          [:dead, :live,        :dead]
        ]

        cell_row = 1
        cell_column = 1

        expect(
          subject.number_of_living_neighbours(cell_row, cell_column, grid)
        ).to eq(1)
    end

    context 'live diagonal neighbours' do
      it 'Returns 1 given the middle cell with 1 live neighbour - top left ' do
        target_cell = :dead

        grid = [
          [:live, :dead,        :dead],
          [:dead, :target_cell, :dead],
          [:dead, :dead,        :dead]
        ]

        cell_row = 1
        cell_column = 1

        expect(
          subject.number_of_living_neighbours(cell_row, cell_column, grid)
        ).to eq(1)
      end
    end

    context 'multiple living neighbours' do
      it 'Returns 2 given the middle cell with 2 live neighbours - row ' do
        target_cell = :dead

        grid = [
          [:dead, :dead,        :dead],
          [:live, :target_cell, :live],
          [:dead, :dead,        :dead]
        ]

        cell_row = 1
        cell_column = 1

        expect(
          subject.number_of_living_neighbours(cell_row, cell_column, grid)
        ).to eq(2)
      end

      it 'Returns 2 given the middle cell with 2 live neighbours - diagonal ' do
        target_cell = :dead

        grid = [
          [:live, :dead,        :dead],
          [:dead, :target_cell, :dead],
          [:dead, :dead,        :live]
        ]

        cell_row = 1
        cell_column = 1

        expect(
          subject.number_of_living_neighbours(cell_row, cell_column, grid)
        ).to eq(2)
      end

      it 'Returns 8 given the middle cell with 8 live neighbours' do
        target_cell = :dead

        grid = [
          [:live, :live,        :live],
          [:live, :target_cell, :live],
          [:live, :live,        :live]
        ]

        cell_row = 1
        cell_column = 1

        expect(
          subject.number_of_living_neighbours(cell_row, cell_column, grid)
        ).to eq(8)
      end
      it 'Returns 4 live nieghbours and ignores distant neighbours' do
        target_cell = :dead

  
        grid = [
        [ :dead, :dead,        :dead, :dead, :live ],
        [ :live, :target_cell, :live, :dead, :live ],
        [ :dead, :live,        :live, :dead, :dead ],
        [ :dead, :dead,        :dead, :live, :dead ],
        [ :dead, :dead,        :dead, :live, :dead ]
        ]

        cell_row = 1
        cell_column = 1
      

        expect(
          subject.number_of_living_neighbours(cell_row, cell_column, grid)
        ).to eq(4)
      end
    end
  
  end
  end
  end
end