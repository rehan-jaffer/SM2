require "sm2/version"

module Sm2
  class Error < StandardError; end

  MAX_QUALITY = 5
  ONE_DAY = 1
  SIX_DAYS = 6

  def self.next_interval(repetitions, last_interval=0, e_factor=2.5)

    raise ArgumentError if repetitions <= 0
    return ONE_DAY if repetitions == 1
    return SIX_DAYS if repetitions == 2
   
    last_interval * e_factor    

  end

  def self.new_e_factor(old_e_factor: 2.5, quality:)
    raise ArgumentError if quality >= 5 || quality < 0 

    if old_e_factor < 1.3
      e_variable = 1.3
    else
      e_variable = old_e_factor
    end

    return e_variable + e_function(quality)
  end

  def self.e_function(quality)
    (0.1 - (MAX_QUALITY - quality)) * (0.08 + (MAX_QUALITY - quality) * 0.02)
  end

end
