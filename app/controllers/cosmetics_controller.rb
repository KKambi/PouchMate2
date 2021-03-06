class CosmeticsController < ApplicationController
  include ActionView::Helpers::DateHelper

  before_action :set_cosmetic, only: [:show, :edit, :update, :destroy]

  # GET /cosmetics/feed
  def feed
    @user = current_user
    @curr_time = Time.zone.now

    # 시간 메세지는 config/locales/ko.yml 에서 수정
    @feeds = ActiveRecord::Base.connection.execute("SELECT a.id AS origin_id, a.user_id AS friend_id, 1 AS idx,  a.created_at AS time FROM cosmetics a, friendships b WHERE a.user_id = b.friend_id AND b.user_id = #{@user.id} UNION ALL SELECT a.id AS origin_id, a.user_id AS friend_id, 2 AS idx, a.created_at AS time  FROM carousels a, friendships b WHERE a.user_id = b.friend_id AND b.user_id = #{@user.id} UNION ALL SELECT a.id AS origin_id, a.user_id AS friend_id, 3 AS idx, a.created_at AS time FROM bests a, friendships b WHERE a.user_id = b.friend_id AND b.user_id = #{@user.id} ORDER BY time DESC")
  end

  # GET /cosmetics/tables/1
  # GET /cosmetics/tables/1.json
  def table
    @curr_time = Time.zone.now

    @carousels = Carousel.where("user_id" => current_user.id)

    @user_id = params[:user_id]
    if @user_id.nil? || @user_id == current_user.id
      @user = current_user
    else
      @user = User.find(@user_id)
    end

    @cosmetics = Cosmetic.where("user_id = ?", @user.id)
    @bests = @user.bests.all

  end

  # GET /cosmetics/new
  def new
    @cosmetic = Cosmetic.new

      gon.country = []
      CosmeticInfo.all.each do |k|
        gon.country.push(k.name)
      end
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
    @cosmetic = Cosmetic.new
    @cosmetic.name = params[:cosmetic][:name]
    @cosmetic.memo = params[:cosmetic][:memo]
    @cosmetic.category = params[:cosmetic][:category]
    @cosmetic.exp_date = params[:cosmetic][:exp_date]
    @cosmetic.user_id = params[:cosmetic][:user_id]
    @cosmetic.cosmetic_info_id = params[:cosmetic][:cosmetic_info_id]
    @cosmetic.carousel_id = params[:cosmetic][:carousel_id]
    @cosmetic.save

    
    if params[:cosmetic][:best_check] == "true"
      @best = Best.new
      @best.cosmetic_id = @cosmetic.id
      @best.user_id = @cosmetic.user_id
      @best.save
    end

    redirect_to root_path
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
        if @commentnew.save

          #Create the notifications
          @joouser = User.find(params[:user_id])
          if @joouser != current_user
            Notification.create(recipient: @joouser, actor: current_user, action: "posted", notifiable: @commentnew)
          end
        end
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
    cbestarr = []

    cbestarr.clear

    current_user.bests.all. each do |cbest|
      cbestarr.push(cbest.cosmetic_id)
    end

    cbestarr=cbestarr.shuffle
    

    for c in cbestarr
      temparr.clear

      Best.where(cosmetic_id: c).each do |temp|
        temparr.push(temp.user_id)
      end #여기에 오는게 맞음

      temparr=temparr.shuffle

      for i in temparr
        if namedic.key?(i) == false
          namedic[i] = [c]
        else
          namedic[i] += [c]
        end
      end
    end

    namedic.each do |key, value|
      countdic[key]=namedic[key].count
    end
    @countdic=countdic.sort_by {|k,v| v}.reverse.to_h


      gon.country = []
      CosmeticInfo.all.each do |k|
        gon.country.push(k.name)
      end



  end

  #검색결과 다은
  def search_result
      @items = CosmeticInfo.where(["name LIKE ?","%#{params[:mySearch]}%"])
      @items2 = Cosmetic.where(["name LIKE ?","%#{params[:mySearch]}%"]) #임시로
      @usersearch = User.where(["nickname LIKE ?","%#{params[:mySearch]}%"])
      @uzi_search = params[:mySearch]

      
      gon.country = []
      CosmeticInfo.all.each do |k|
        gon.country.push(k.name)
      end
  
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
