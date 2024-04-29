class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_blog_post, only: [:edit, :update, :destroy]
  
  def index
    @blog_posts = user_signed_in? ? BlogPost.sorted : BlogPost.published.sorted
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to "/blog_posts"
  end

  def new
    @blog_posts = BlogPost.new
  end

  def create
    @blog_posts = BlogPost.new(blog_post_params)
    if @blog_posts.save
      redirect_to @blog_posts
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    #@blog_posts = BlogPost.find(params[:id]) 
  end

  def update
    #@blog_posts = BlogPost.find(params[:id])
    if @blog_posts.update(blog_post_params)
      redirect_to @blog_posts
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    #@blog_posts = BlogPost.find(params[:id])
    @blog_posts.destroy
    redirect_to articles_path
  end


  
private
  def blog_post_params
    params.require(:blog_post).permit(:title, :content, :published_at)
  end

  def set_blog_post
    @blog_posts = user_signed_in? ? BlogPost.find(params[:id]) : @blog_posts = BlogPost.published.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to "/blog_posts"
  end
end
