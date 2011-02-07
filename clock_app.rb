#!/usr/bin/env ruby -rubygems
#
# File: clock_app.rb
# Desc: a skinable clock interface with tween animations
# Nerd: Kevin Alford (zeroeth@pixelflow.org)
# Date: 11/20/09
#

require 'gosu'

class Hand < Gosu::Image
  attr_accessor :angle, :scale, :center_x, :center_y, :position, :window

  def initialize(window, file, position)
    super(window, file, true)
    self.window = window
    self.angle = 0.0
    self.position = position
    fit_to_window
    center
  end

  def fit_to_window
    largest_side = [self.height, self.width].max
    smallest_view = [window.height, window.width].min
    self.scale = 1.0 * smallest_view / largest_side
  end

  def center
    self.center_x = window.width/2
    self.center_y = window.height/2
  end

  def draw
    clr = Gosu::Color.new(0xffffffFF)
    draw_rot center_x, center_y, 0, angle, 0.5, 0.5, scale, scale, clr
  end

  def time
    window.time
  end

  def set_angle
  end
end

class MilliHand < Hand
  def set_angle
    self.angle  = (360.0/1000) * (time.usec/1000.0)
  end
end

class SecondHand < Hand
  def set_angle
    self.angle  = (360.0/60) * (time.sec + (time.usec/1000.0/1000.0))
  end
end

class MinuteHand < Hand
  def set_angle
    self.angle  = (360.0/60) * (time.min + time.sec/60.0)
  end
end

class HourHand < Hand
  def set_angle
    self.angle = (360.0/12) * ((time.hour % 12) + time.min/60.0)
  end
end

class GameWindow < Gosu::Window
  attr_accessor :hands, :time

  def initialize
    super(640, 640, false)
    self.caption = "cl0ck"

    self.hands = []
    #skin = "moving_numbers"
    #skin = "counterweight"
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
  end

  # update to chingu so updating and drawing is automatic for game objects
  def update
    super
    set_time
    hands.each(&:set_angle)
  end

  def set_time
    self.time = Time.now
  end

  def draw
    super
    hands.each(&:draw)
  end
end

window = GameWindow.new
window.show
