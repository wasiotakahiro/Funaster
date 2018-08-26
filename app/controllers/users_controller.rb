class UsersController < ApplicationController
  before_action :correct_user, only:  [:edit, :update]

  def new
    @user = User.new
  end
  # edit updte消してもいい
  def edit
  end


  def update
    if @user.update_attributes(user_params)
      flash[:succsess] = "ユーザー登録情報"
      redirect_to user_path
    else
      render "edit"
    end
  end

  def show
    @user = User.find(params[:id])
    @favorite_funastars = @user.favorite_funastars
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:icon_image, )
  end
  # def set_user_infomation
  #   @user = User.find(params[:id])
  # end

  # 消してもいい
   def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path)unless current_user?(@user)

    def require_sign_in!
      unless logged_in?
        redirect_to new_session_path, noctice:"ログインしてください"
    end
  end
