require 'geocoder'

Geocoder.configure(

   # geocoding service:
   :lookup => :google,

   # IP address geocoding service:
   :ip_lookup => :maxmind,

   # to use an API key:
   :api_key => 'AIzaSyBHzlfoHrDXVc5BF2Gbcs4BXRgWma-7XDk',

   # this is very important option for configuring geocoder with API key
   :use_https => true,

   # geocoding service request timeout, in seconds (default 3):
   :timeout => 3,

   # set default units to kilometers:
   :units => :km,
)

class Dog
  def initialize(name)
    @name = name
    @walks = []
    @distance = []
    @time = []

  end
  def walk(location, length, clock)
    @place = Geocoder.coordinates location
    @walks.push({location: location, length: length, co_ords:@place})
    @distance.push(length)
    @time.push(clock)
    self
  end
  def display_walks
      @walks.each do |value|
      puts "#{@name} walked around #{value[:location]},  #{value[:co_ords]} for #{value[:length]}km."
      self
      end
  end
  def total_distance
        puts "#{@name}'s total distance for walking is: #{@distance.sum}km"
  end
  def total_time
    puts "#{@name}'s walking times were: #{@time[0]} and #{@time[1]}"
  end
end
  doggo = Dog.new("Rover")
  doggo.walk("Brisbane, QLD", 20, "2pm").walk("Gold Coast, QLD", 15, "1pm").display_walks
  doggo.total_distance
  doggo.total_time
