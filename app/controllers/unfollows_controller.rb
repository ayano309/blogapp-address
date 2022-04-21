class UnfollowsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    current_user.unfollow!(params[:user_id])
     redirect_to request.referer
  end
  
  
end
