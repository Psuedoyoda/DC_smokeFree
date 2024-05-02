Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  #root "blog_posts#index"
  root "home_page#index"
  

#blog posts and article creation (Simple)
  resources :blog_posts do
    resource :cover_image, only: [:destroy], module: :blog_posts
  end


  get "/articles", to: "blog_posts#index", as: :articles
  get "/privacy policy", to: "privacy#index", as: :privacy
  get "/terms_of_use", to: "tos_page#index", as: :tou
  get "/about_us", to: "about_us#index", as: :about_page
  #My hardcoded routes (Complex)
  #get "/articles/new", to: "blog_posts#new", as: :new_article
 
  #get "/articles/:id", to: "blog_posts#show", as: :blog_post
  #patch "/articles/:id", to: "blog_posts#update"
  #delete "/articles/:id", to: "blog_posts#destroy"
  #get "/articles/:id/edit", to: "blog_posts#edit", as: :edit_articles

  #post "/articles_create", to: "blog_posts#create", as: :blog_posts



  
  


















end
