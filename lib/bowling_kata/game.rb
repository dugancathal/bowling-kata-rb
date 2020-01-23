module BowlingKata
  class Game
    def initialize
      @rolls = []
    end

    def roll(pins)
      @rolls << pins
    end

    def score
      frames = @rolls.each_slice(2).to_a
      frame_scores = frames.each_with_index.map do |frame, i|
        frame_score = frame.sum
        frame_score += frames[i+1][0] if is_spare(frame_score)
        frame_score
      end

      frame_scores.sum
    end

    private

    def is_spare(frame_score)
      frame_score == 10
    end
  end
end