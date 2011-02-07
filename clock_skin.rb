=begin
    skin = "color_rings"
    #skin = "ellipse"
    # file paths should use join
    hands << Hand.new(self, "skins/#{skin}/back.png", 0)
    hands << SecondHand.new(self, "skins/#{skin}/second.png", 3)
    hands << MinuteHand.new(self, "skins/#{skin}/minute.png", 2)
    hands << HourHand.new(self, "skins/#{skin}/hour.png", 1)
    hands << MilliHand.new(self, "skins/#{skin}/msec.png", 1)
    #hands << Hand.new(self, "skins/#{skin}/meridian.png", 0)
    #hands << Hand.new(self, "skins/#{skin}/face.png", 4)
=end
class ClockSkin
end
