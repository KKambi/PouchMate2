class CosmeticsController < ApplicationController
  before_action :set_cosmetic, only: [:show, :edit, :update, :destroy]


  # GET /cosmetics
  def mypage
    @user = current_user
    @cosmetics = Cosmetic.where("user_id = ?", current_user.id)

    @user = User.find(current_user.id)
    @bests = current_user.bests.all

  end

  # GET /cosmetics/tables/1
  # GET /cosmetics/tables/1.json
  def table
    @owner_user_id = params[:user_id]
    @cosmetics = Cosmetic.where("user_id = ?", @owner_user_id)
    @user = User.find(params[:user_id])
    @bests = User.find(params[:user_id]).bests.all
  end

  # GET /cosmetics/new
  def new
    @cosmetic = Cosmetic.new
  end

  def get_middle_categories
    @middle_categories = Category.find(params[:category_id]).children
  end

  def get_small_categories
    @small_categories = Category.find(params[:category_id]).children
  end

  # GET /cosmetics/1/edit
  def edit
  end

  # POST /cosmetics
  # POST /cosmetics.json
  def create
    @cosmetic = Cosmetic.new(cosmetic_params)

    respond_to do |format|
      if @cosmetic.save
        format.html { redirect_to @cosmetic, notice: 'Cosmetic was successfully created.' }
        format.json { render :show, status: :created, location: @cosmetic }
      else
        format.html { render :new }
        format.json { render json: @cosmetic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cosmetics/1
  # PATCH/PUT /cosmetics/1.json
  def update
    respond_to do |format|
      if @cosmetic.update(cosmetic_params)
        format.html { redirect_to @cosmetic, notice: 'Cosmetic was successfully updated.' }
        format.json { render :show, status: :ok, location: @cosmetic }
      else
        format.html { render :edit }
        format.json { render json: @cosmetic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cosmetics/1
  # DELETE /cosmetics/1.json
  def destroy
    @cosmetic.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Cosmetic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  #화장대 댓글 다은
  def commentcreate
        @commentnew = Comment.new
        @commentnew.content = params[:content]
        @commentnew.writer_id = current_user.id
        @commentnew.user_id = params[:user_id]
        @commentnew.save
        
        redirect_back(fallback_location: root_path)
        
  end

  def commentdestroy
      @commentdestroy = Comment.find(params[:comment_id])
      @commentdestroy.destroy

      redirect_back(fallback_location: root_path)
  end

  #검색 페이지 다은
  def search
    namedic=Hash.new 
    countdic=Hash.new 
    temparr=[]

    current_user.bests.all. each do |cbest|
      temparr.clear
      
      Best.where(cosmetic_id: cbest.cosmetic_id).each do |temp|
        temparr.push(temp.user_id)

        for i in temparr
          if namedic.key?(i) == false
            namedic[i] = [cbest]
          else
            namedic[i] += [cbest]
          end
        end
      end  #temp 루프 끝
    end

    namedic.each do |key, value|
      countdic[key]=namedic[key].count
    end
    @countdic=countdic.sort_by {|k,v| v}.reverse.to_h



  end

  #검색결과 다은
  def search_result
      @items = CosmeticInfo.where(["name LIKE ?","%#{params[:mySearch]}%"])
      @items2 = Cosmetic.where(["name LIKE ?","%#{params[:mySearch]}%"]) #임시로
      @usersearch = User.where(["nickname LIKE ?","%#{params[:mySearch]}%"])
      @uzi_search = params[:mySearch]
  
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cosmetic
      @cosmetic = Cosmetic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cosmetic_params
      params.require(:cosmetic).permit(:name, :memo, :category, :exp_date, :user_id, :cosmetic_info_id, :carousel_id)
    end
end
