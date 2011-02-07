#!/usr/bin/env ruby -rubygems
#
# File: clock_app.rb
# Desc: a skinable clock interface with tween animations
# Nerd: Kevin Alford (zeroeth@pixelflow.org)
# Date: 11/20/09
#

require 'gosu'
require 'clock_hands'

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
