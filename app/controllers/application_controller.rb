require 'ext/numeric'

class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

 module Calc
    def future_value(amount, rate = 0.06, timeframe = 1)
      round(BigDecimal.new((amount * (1 + rate.percent) ** timeframe).to_s))
    end

    def present_value(amount, rate = 0.06, timeframe = 1)
      round(BigDecimal.new((amount / (1 + rate.percent) ** timeframe).to_s))
    end

    def round(amount, precision = 2)
      amount.round(precision).to_f
    end
 end 
end
