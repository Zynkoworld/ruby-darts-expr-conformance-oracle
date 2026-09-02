class Darts
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def score
    scores.detect do |range, _|
      range.cover? distance_to_bullseye
    end[1]
  end

  private

  def scores
    {
      0.0..1.0 => 10,
      1.0..5.0 => 5,
      5.0..10.0 => 1,
      10.0..1.0/0 => 0,
    }
  end

  def distance_to_bullseye
    Math.sqrt(x * x + y * y)
  end
end

require 'json'
__exprs = JSON.parse("[\"Darts.new(-9, 9).score\", \"Darts.new(0, 10).score\", \"Darts.new(-5, 0).score\", \"Darts.new(0, -1).score\", \"Darts.new(0, 0).score\", \"Darts.new(-0.1, -0.1).score\", \"Darts.new(0.7, 0.7).score\", \"Darts.new(0.8, -0.8).score\", \"Darts.new(-3.5, 3.5).score\", \"Darts.new(-3.6, -3.6).score\", \"Darts.new(-7.0, 7.0).score\", \"Darts.new(7.1, -7.1).score\", \"Darts.new(0.5, -4).score\"]")
__out = []
__exprs.each do |e|
  begin
    __out << {ok: true, v: eval(e)}
  rescue => ex
    __out << {ok: false, e: ex.class.to_s}
  end
end
puts JSON.generate({out: __out})
