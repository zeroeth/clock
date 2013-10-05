require 'yaml'
require './clock_skin'

class ClockSkins
  attr_accessor :skins, :skin_hash

  def initialize
    self.skins = []
    self.skin_hash = {}
  end

  def load(path = "skins")
    Dir[File.join(path, "**", "skin.yaml")].each do |file|
      skin = ClockSkin.new(path, YAML.load_file(file))
      self.skins << skin
      self.skin_hash[skin.name] = skin
    end
  end

  def by_name(name)
    skin_hash[name]
  end
end
