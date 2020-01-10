RSpec.describe Sm2 do
  it "has a version number" do
    expect(Sm2::VERSION).not_to be nil
  end

  describe "intervals" do

    it "always returns 1 (day) for the first interval" do

      repetition = 1
      interval = Sm2.next_interval(repetition)
      expect(interval).to eq 1

    end

    it "always returns 6 (days) for the second interval" do

      repetition = 2
      interval = Sm2.next_interval(repetition)
      expect(interval).to eq 6

    end

    it "returns an ever-increasing value of intervals" do

      intervals = []
      e_factor = 2.5

      2.upto(10) do |repetition|
        intervals.push Sm2.next_interval(repetition, intervals.last, e_factor)
      end

      expect(intervals
        .each_cons(2)
        .map { |x,y| y <=> x }).to all eq 1
    end

  end

  describe "e-factor" do

    it "calculates a new e-factor based on the old" do
      e_factor = Sm2.new_e_factor(quality: 1)
      expect(e_factor).not_to be nil
    end

    it "raises an exception if supplied quality of the response is greater than 5" do
      expect { Sm2.new_e_factor(quality: 6) }.to raise_error ArgumentError
    end

    it "raises an exception if supplied quality of the response is less than 0" do
      expect { Sm2.new_e_factor(quality: -1) }.to raise_error ArgumentError
    end

  end

end

