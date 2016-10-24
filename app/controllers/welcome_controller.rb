class WelcomeController < ApplicationController

  def index
    @pickups = Item.where pickup: true
  end

end
