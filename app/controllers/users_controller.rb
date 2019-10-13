class UsersController < ApplicationController
  def show
     @user = User.find_by(username: params[:username])
     @tweets = @user.tweets
     @tweetings = Tweet.where(user: current_user.all_following)
  end
end