module BowlingKata
  RSpec.describe "BowlingGame" do
    let(:game) { Game.new }

    it 'works for completely guttered games' do
      roll_times(20, 0)
      expect(game.score).to eq 0
    end

    it 'works for single pin games' do
      roll_times(20, 1)
      expect(game.score).to eq 20
    end

    it 'can score spares' do
      roll_spare
      roll_times(1, 3)
      roll_times(17, 0)

      expect(game.score).to eq 16
    end

    def roll_times(n, pins)
      n.times { game.roll(pins) }
    end

    def roll_spare
      roll_times(1, 5)
      roll_times(1, 5)
    end
  end
end