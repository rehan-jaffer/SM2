RSpec.describe Sm2 do
  it "has a version number" do
    expect(Sm2::VERSION).not_to be nil
  end

  describe "e-factor" do

    it "calculates a new e-factor based on the old" do

      ef = Sm2.new_ef(ef: 1, q: 1)
      expect(ef).not_to be nil

    end

  end

end
