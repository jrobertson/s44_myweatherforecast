#!/usr/bin/env ruby

# file: s44_myweatherforecast.rb
 

class S44_MyWeatherForecast

  def initialize(myweatherforecast=nil)
    @w = myweatherforecast
  end

  def afternoon()
    summary(:afternoon)
  end

  alias this_afternoon afternoon

  private

  def summary(period)

    a = @w.this.method(period).call
    min, max = a.minmax_by {|x| x.temperature}.map(&:temperature)
    a.map(&:summary).uniq

    a2 = a.map(&:summary).uniq

    s2 = if a2.length < 2 then
      a2[0]
    elsif a2.length < 3 then
      a2.join ', but also '
    else
      "%s, but also %s" % [a2[0..-2].join(', '), a2[-1]]
    end

    s3 = "with a minimum temperature of #{min} celcius " + 
                                  "and a maximum temperature of #{max} celcius"

    s1 = "The weather this #{period.to_s} is to be"
    
    [s1, s2.downcase, s3].join(' ') + '.'

  end
end