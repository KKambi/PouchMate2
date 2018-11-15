class CarouselsController < ApplicationController
  before_action :set_carousel, only: [:edit, :update, :destroy]

  # GET /carousels/new
	def new
		@carousel = Carousel.new
	end

  # POST /carousels
  # POST /carousels.json
  def create
    @carousel = Carousel.new(carousel_params)

    respond_to do |format|
      if @carousel.save
        format.html { redirect_to root_path, notice: 'Carousel was successfully created.' }
        format.json { render :show, status: :created, location: root_path }
      else
        format.html { render :new }
        format.json { render json: @carousel.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /carousels/1/edit
  def edit
  end

  # PATCH/PUT /carousels/1
  # PATCH/PUT /carousels/1.json
  def update
    respond_to do |format|
      if @carousel.update(carousel_params)
        format.html { redirect_to @carousel, notice: 'carousel was successfully updated.' }
        format.json { render :show, status: :ok, location: @carousel }
      else
        format.html { render :edit }
        format.json { render json: @carousel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carousels/1
  # DELETE /carousels/1.json
  def destroy
    @carousel.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'carousel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carousel
      @carousel = Carousel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carousel_params
      params.require(:carousel).permit(:name, :user_id, :carousel_background_id)
    end
end
