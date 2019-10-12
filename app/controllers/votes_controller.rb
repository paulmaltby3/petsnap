class VotesController < ApplicationController
  before_action :authenticate_user!
  
  def create
     tweet = Tweet.find(params[:id])
     tweet.liked_by current_user
     redirect_to user_path(current_user.username), notice: "You have successfully liked a tweet"
  end
  
  def destroy
      tweet = Tweet.find(params[:id])
      tweet.unliked_by current_user
      redirect_to user_path(current_user.username), notice: "You have successfully unliked a tweet"
  end


end