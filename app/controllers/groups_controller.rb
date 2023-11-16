class EntitiesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @entities = current_user.entities
  end
end