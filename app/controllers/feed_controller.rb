class FeedController < ApplicationController
  before_action :authenticate_user!
  def show
    @tweetings = Tweet.where(user: current_user.all_following)
  end
end
