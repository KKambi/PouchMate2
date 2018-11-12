class CarouselsController < ApplicationController

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


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def carousel_params
      params.require(:carousel).permit(:name, :user_id, :carousel_background_id)
    end
end
