class PagesController < ApplicationController
  def home
  end
  
  def index
    @followings = Tweet.all
  end
end
