class FollowsController < ApplicationController
  before_action :authenticate_user!
  
  def create
      @user = User.find_by(username: params[:username])
      Follow.create(followable: @user, follower: current_user)
      redirect_to user_path(@user.username), notice: "Successfully followed user"
  end
  
  def destroy
      @user = User.find_by(username: params[:username])
      Follow.find_by(followable: @user, follower: current_user).destroy
      redirect_to user_path(@user.username), notice: "Successfully unfollowed user"
  end

  def show
    #@user = User.followers_count
    #@user = User.follow_count
    #@followings = Follow.where(user: current_user.followers_count)

    #@followings = User.find_by(username: params[:username])
    #Follow.follow_count
    #@user = User.find_by(username: params[:username])
    #tweet = Tweet.find(params[:id])
    #user = find_by(followable: @user, follower: current_user)
    #user.follow(tweet) # Creates a record for the user as the follower and the tweet as the followable

  end
  
end

