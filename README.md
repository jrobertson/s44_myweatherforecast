# Introducing the s44_myweatherforecast gem    


    require 'myweatherforecast'
    require 's44_myweatherforecast'

    api_key = '46xxxxxxxxxac6076ea01cbff4'

    mwf = MyWeatherForecast.new 'Edinburgh',api_key: api_key

    w = S44_MyWeatherForecast.new(mwf)
    w.this_afternoon

Output:

<pre>
#=> "The weather this afternoon is to be light rain, drizzle, partly cloudy, 
but also clear with a minimum temperature of 5° celcius and 
a maximum temperature of 6° celcius."
</pre>


## Resources

* Introducing the MyWeatherForecast gem http://www.jamesrobertson.eu/snippets/2015/oct/22/introducing-the-myweatherforecast-gem.html
* s44_myweatherforecast https://rubygems.org/gems/s44_myweatherforecast

s44myweatherforecastgem s44 myweatherforecast
