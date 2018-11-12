class BestsController < ApplicationController
	def best_toggle
    bestCount= Best.where(user_id: current_user.id).count
	
    best = Best.find_by(user_id: current_user.id, cosmetic_id: params[:cosmetic_id])
	# else
  # flash[:overBest] = "인생템이 5개를 초과하여 저장하지 못합니다."

  # end

 	# if limitBest > 5
	# Best.destroy

	if best.nil?
    Best.create(user_id: current_user.id, cosmetic_id: params[:cosmetic_id])   
  else
  	best.destroy
  end
    redirect_back fallback_location: root_path
  # end
	end
end
