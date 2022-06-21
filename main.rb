#!/usr/bin/env ruby
require './app'

class Main
  def initialize
    @app = App.new
    @app.interface
  end
end

Main.new
