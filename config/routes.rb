Rails.application.routes.draw do
  root 'epicenter#feed'

  get 'user_profile' => 'epicenter#show_user'

  get 'now_following' => 'epicenter#now_following'

  get 'unfollow' => 'epicenter#unfollow'

  get 'global_feed' => 'epicenter#global_feed'

  post 'compose_tweet' => 'epicenter#compose_tweet'

  get 'js_practice' => 'epicenter#js_practice'

  get 'users' => 'epicenter#users'

  get 'followers' => 'epicenter#followers'

  get 'following' => 'epicenter#following'

  resources :tweets
  devise_for :users
end
