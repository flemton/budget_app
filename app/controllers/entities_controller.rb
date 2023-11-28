class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def index
    @entities = @group.entities
    @total = @entities.sum(:amount)
  end

  def new
    @entity = @group.entities.build
  end

  def create
    @entity = @group.entities.build(entity_params.merge(user: current_user))
    if @entity.save
      redirect_to group_entities_path(@group)
    else
      render :new
    end
  end

  private

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
