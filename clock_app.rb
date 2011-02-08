#!/usr/bin/env ruby -rubygems
#
# File: clock_app.rb
# Desc: a skinable clock interface with animations
# Nerd: Kevin Alford (zeroeth@pixelflow.org)
# Date: 11/20/09
#

require 'rubygems'
require 'bundler/setup'
require 'gosu'
require 'clock_hands'
require 'clock_skins'

class GameWindow < Gosu::Window
  attr_accessor :hands, :time, :skins

  def initialize
    super(640, 640, false)
    self.caption = "cl0ck"
    $window = self
    self.skins = ClockSkins.new
    skins.load
    self.hands = skins.by_name("color_rings").hands
  end

  def update
    super
    set_time
    hands.each(&:set_angle)
  end

  def button_down(id)
    case id
    when Gosu::KbQ
      exit
    when Gosu::KbLeft
      self.hands = skins.skins[rand(skins.skins.size)].hands
    end
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
