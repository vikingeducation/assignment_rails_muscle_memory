class ShmarticlesController < ApplicationController
  before_action :set_shmarticle, only: [:show, :edit, :update, :destroy]

  # GET /shmarticles
  # GET /shmarticles.json
  def index
    @shmarticles = Shmarticle.all
  end

  # GET /shmarticles/1
  # GET /shmarticles/1.json
  def show
  end

  # GET /shmarticles/new
  def new
    @shmarticle = Shmarticle.new
  end

  # GET /shmarticles/1/edit
  def edit
  end

  # POST /shmarticles
  # POST /shmarticles.json
  def create
    @shmarticle = Shmarticle.new(shmarticle_params)

    respond_to do |format|
      if @shmarticle.save
        format.html { redirect_to @shmarticle, notice: 'Shmarticle was successfully created.' }
        format.json { render :show, status: :created, location: @shmarticle }
      else
        format.html { render :new }
        format.json { render json: @shmarticle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shmarticles/1
  # PATCH/PUT /shmarticles/1.json
  def update
    respond_to do |format|
      if @shmarticle.update(shmarticle_params)
        format.html { redirect_to @shmarticle, notice: 'Shmarticle was successfully updated.' }
        format.json { render :show, status: :ok, location: @shmarticle }
      else
        format.html { render :edit }
        format.json { render json: @shmarticle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shmarticles/1
  # DELETE /shmarticles/1.json
  def destroy
    @shmarticle.destroy
    respond_to do |format|
      format.html { redirect_to shmarticles_url, notice: 'Shmarticle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmarticle
      @shmarticle = Shmarticle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shmarticle_params
      params.require(:shmarticle).permit(:title, :body)
    end
end
