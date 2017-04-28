#!/usr/bin/env ruby

# file: s44_myweatherforecast.rb
 

class S44_MyWeatherForecast

  def initialize(myweatherforecast=nil)
    @w = myweatherforecast
  end

  def afternoon()
    summary :afternoon
  end
  
  def ahead(advance=2)
    self.method(@w.today.ahead(advance)).call
  end
  
  alias this_afternoon afternoon  
  
  def early_hours()
    summary :early_hours
  end
  
  def morning
    summary :morning
  end
  
  def evening()
    summary :evening
  end

  # e.g. is it going to rain tomorrow? return an array of periods within the 
  # day of when it will rain or an empty array if there is no rain forecast
  
  def query(day=:tomorrow, desc='rain')
    
    %i(morning afternoon evening early_hours night).select do |x| 
      @w.method(day.to_sym).call.method(x).call.detect do |x|
        x.to_s =~ /#{desc}/i
      end
    end
    
  end

  alias this_evening evening
  
  def tomorrow()
    
    s = @w.tomorrow.to_s
    min, max, desc = s.match(/\w+:\s+([^ ]+) ([^,]+),\s+(.*)\.$/).captures    
    outlook('tomorrow', min, max, desc: desc)
    
  end
  
  def tonight()
    summary :night
  end
  
  alias night tonight
  

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


    t = case period
    when :night
      'tonight'
    when :early_hours
      'in the early hours'
    else
      'this ' + period.to_s
    end
    
    outlook(t, min, max, desc: s2)

  end
  
  def outlook(t, min, max, desc: '')
    
    "The weather #{t}, #{desc.downcase} with a minimum temperature of #{min} " + 
        "celcius and a maximum temperature of #{max} celcius."    
  end
end
