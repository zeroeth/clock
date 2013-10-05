require './clock_hands'

class ClockSkin
  attr_accessor :name, :hands
  def initialize(path = "skins", options = {})
    self.name = options['name']
    self.hands = []
    if options['hands']
      options['hands'].each_with_index do |hand, zlevel|
	hands << eval(hand.capitalize+"Hand").new($window, File.join(path, self.name, hand+".png"), zlevel)
      end
    end
  end
end
