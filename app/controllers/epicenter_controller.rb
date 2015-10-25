class EpicenterController < ApplicationController

	before_filter :authenticate_user!

  def feed
  	@following_tweets = []
  	tweets = Tweet.all.order(created_at: :desc)
  	tweets.each do |tweet|
  		if current_user.following.include?(tweet.user_id) || tweet.user_id == current_user.id
  			@following_tweets.push(tweet)
  		end
  	end
    @users = User.all
    @followers = 0
    @users.each do |user|
      if user.following.include?(current_user.id)
        @followers += 1
      end
    end
  end

  def show_user
    @users = User.all
  	@user = User.find(params[:id])
    @followers = 0
    @users.each do |user|
      if user.following.include?(@user.id)
        @followers += 1
      end
    end
  end

  def now_following
  	current_user.following.push(params[:id].to_i)
  	current_user.save

  	redirect_to user_profile_path(id: params[:id])
  end

  def unfollow
  	current_user.following.delete(params[:id].to_i)
  	current_user.save

  	redirect_to user_profile_path(id: params[:id])
  end

  def global_feed
  	@tweets = Tweet.all.order(created_at: :desc)
  end

  def compose_tweet
    tweet = Tweet.new
    tweet.message = params[:message]
    tweet.user_id = params[:user_id]
    tweet.save
    redirect_to root_path
  end

  def js_practice
  end

  def users
    @users = User.all
  end

  def following
    @user = User.find(params[:id])
    @users = User.all
    @following = []
    @user.following.each do |user|
    end
  end

  def followers
    @user = User.find(params[:id])
    @users = User.all
    @followers = []
    @users.each do |user|
      if user.following.include?(@user)
        followers.push(user)
      end
    end
  end
end
