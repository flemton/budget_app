class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:show]

  def index
    @groups = current_user.groups
    @total_amount = @groups.joins(:entities).sum('entities.amount')
  end

  def new
    @group = Group.new
    @icons = ['&#x1F374;', '&#x2708;', '&#x1F393;', '&#x1F489;', '&#x1F697;', '&#x1F4A1;', '&#x1F3E0;', '&#x1F3A7;',
              '&#x1F6CD;', '&#x1F381;']
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def show
    # @group is set by set_group method
  end

  private

  def set_group
    @group = Group.includes(:entities).find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
