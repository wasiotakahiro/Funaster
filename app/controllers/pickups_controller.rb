class PickupsController < ApplicationController
  before_action :set_funastar, only: [:show,]
  def index
      @favorite = current_user.favorites.find_by(funastar_id: @funastar.id)
  end
end

def show
  @favorite = current_user.favorites.find_by(funastar_id: @funastar.id)
end


private
def set_funastar
  @funastar = Funastar.find(params[:id])
end


def funastar_params
  params.require(:funastar).permit(:funastar_id, :user_id)
end
