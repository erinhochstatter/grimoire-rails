class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]

  # GET /posts
  def index
    @posts = case params[:filter]
             when 'articles'
               Post.articles
             when 'books'
               Post.books
             when 'podcasts'
               Post.podcasts
             else
               Post.all
             end
    render json: { posts: @posts }
  end

  # GET /posts/1
  def show
    render json: @post, root: true
  end

  def index_filter
    params[:filter] if Post::Filters::ALL.include?(params[:filter])
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post, root: true
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:author, :string, :title, :string, :kind, :string, :datePublished, :Date, :filter,
                                 :friend_id, :int)
  end
end
