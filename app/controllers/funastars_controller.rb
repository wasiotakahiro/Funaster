class FunastarsController < ApplicationController
  before_action :set_funastar, only: [:show, :edit, :update, :destroy]
  before_action :require_sign_in!, only: [:new, :edit, :show]
  before_action :correct_user, only:  [:edit, :update]

 def top
  end

  def index
    @funastars = Funastar.all
  end


  def show
    @favorite = current_user.favorites.find_by(funastar_id: @funastar.id)
  end


  def new
  if params[:back]
    @funastar = Funastar.new(funastar_params)
    @funastar.image.retrieve_from_cache!  params[:cache][:image]
  else
    @funastar = Funastar.new
  end
end


  def edit
    @funastar = Funastar.find(params[:id])
  end


  def create
    @funastar = Funastar.new(funastar_params)
    @funastar.user_id = current_user.id


    respond_to do |format|
      if @funastar.save
        @inform = current_user.email
        FunastarMailer.funastar_mail(@funastar).deliver

        format.html { redirect_to @funastar, notice: 'Funastar was successfully created.' }
        format.json { render :show, status: :created, location: @funastar }
      else
        format.html { render :new }
        format.json { render json: @funastar.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @funastar.update(funastar_params)
        format.html { redirect_to @funastar, notice: 'Funastar was successfully updated.' }
        format.json { render :show, status: :ok, location: @funastar }
      else
        format.html { render :edit }
        format.json { render json: @funastar.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    if @funastar.user_id == current_user.id
       @funastar.destroy
       respond_to do |format|
        format.html { redirect_to funastars_url, notice: 'Funastar was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to funastars_path
    end
  end

  def confirm
     @funastar = Funastar.new(funastar_params)
  end

  private

    def set_funastar
      @funastar = Funastar.find(params[:id])
    end


    def funastar_params
      params.require(:funastar).permit(:image, :image_cache, :caption)
    end

    def set_user_infomation
      @user = User.find(params[:id])
    end

    def require_sign_in!
      unless logged_in?
        redirect_to new_session_path, noctice:"ログインしてください"
    end
  end
end
