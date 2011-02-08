require 'test_helper'
require 'clock_skins'

class ClockSkinsTest < Test::Unit::TestCase
  context "ClockSkins" do
    setup do
      @skins = ClockSkins.new
      $window = Gosu::Window.new(300,200, false)
    end

    should "load all skin files" do
      @skins.load(File.join("test", "skins"))
      assert_equal 2, @skins.skins.size
    end

    should "return skin by name" do
      @skins.load(File.join("test", "skins"))
      skin = @skins.by_name("fancy")
      assert_equal "fancy", skin.name
      assert_kind_of ClockSkin, skin
    end 
  end
end

