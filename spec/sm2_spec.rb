RSpec.describe Sm2 do
  it "has a version number" do
    expect(Sm2::VERSION).not_to be nil
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
