class FunastarsController < ApplicationController
  before_action :set_funastar, only: [:show, :edit, :update, :destroy]

  # GET /funastars
  # GET /funastars.json
  def index
    @funastars = Funastar.all
  end

  # GET /funastars/1
  # GET /funastars/1.json
  def show
  end

  # GET /funastars/new
  def new
  if params[:back]
    @funastar = Funastar.new(funastar_params)
  else
    @funastar = Funastar.new
  end
end


  # GET /funastars/1/edit
  def edit
    @funastar = Funastar.find(params[:id])
  end

  # POST /funastars
  # POST /funastars.json
  def create
    @funastar = Funastar.new(funastar_params)
    @funastar.user_id = current_user.id

    respond_to do |format|
      if @funastar.save

        format.html { redirect_to @funastar, notice: 'Funastar was successfully created.' }
        format.json { render :show, status: :created, location: @funastar }
      else
        format.html { render :new }
        format.json { render json: @funastar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funastars/1
  # PATCH/PUT /funastars/1.json
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

  # DELETE /funastars/1
  # DELETE /funastars/1.json
  def destroy
    @funastar.destroy
    respond_to do |format|
      format.html { redirect_to funastars_url, notice: 'Funastar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
     @funastar = Funastar.new(funastar_params)
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funastar
      @funastar = Funastar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funastar_params
      params.require(:funastar).permit(:image, :caption)
    end
end
