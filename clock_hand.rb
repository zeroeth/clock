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
