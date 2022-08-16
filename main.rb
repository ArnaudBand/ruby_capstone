require_relative './app'

class Main
  attr_reader :app

  def initialize
    @app = App.new
  end
end
