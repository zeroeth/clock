require 'test_helper'
require 'clock_skin'
require 'clock_hands'

class ClockSkinTest < Test::Unit::TestCase
  context "ClockSkin" do
    setup do
      $window = Gosu::Window.new(300, 200, false)
    end

    should "load hands from config" do
      # proper order zlayering
      @skin = ClockSkin.new File.join("test", "skins"), {'name' => 'fancy', 'hands' => ['msec', 'back', 'hour']}
      assert_equal [MsecHand, BackHand, HourHand], @skin.hands.map(&:class)
    end
  end
end
