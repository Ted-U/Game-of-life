require_relative '../game_of_life'

describe 'game of life' do
  it 'when given a 2x2 square of live cells in a 4x4 grid no change will occur' do
    # arrange
    current_grid = [
      [ :dead, :dead, :dead, :dead ],
      [ :dead, :live, :live, :dead ],
      [ :dead, :live, :live, :dead ],
      [ :dead, :dead, :dead, :dead ]
    ]

    game_of_life = GameOfLife.new

    # act
    next_grid = game_of_life.get_next_grid(current_grid)

    # assert
    expect(next_grid).to eq(current_grid)
  end
end

