class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]
    before_action :authenticate_user!, only: [:create, :update, :destroy]

    def index
      posts = Post.all
      render json: posts.as_json
    end

    def show
      render json: @post.as_json
    end

    def create
      post = Post.new(post_params)
      # attach_photo(post) if post_params[:photo].present?

      if post.save
        render json: post, status: :created
      else
        render json: post.errors, status: :unprocessable_entity
      end
    end

      # def create
      #   item = Post.create(post_params)
      #   # Attach picture to our item, if available
      #   attach_photo(item) if post_params[:photo].present?

      #   # Reply with success if the object was saved, or failure if it was not.
      #   if item.persisted?
      #     render json: item, status: 200
      #   else
      #     render json: item, status: 400
      #   end
      # end

    def update
      if post_params[:like]
        if !@post.like
          @post.like = 1
        else
          @post.like += 1
        end
      end

      if post_params[:dislike]
        if !@post.dislike
          @post.dislike = 1
        else
          @post.dislike += 1
        end
      end

      if post_params[:title]
        @post.title = post_params[:title]
      end

      if @post.save!
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @post.destroy
    end


  private

  # def attach_photo(item)
  #   item.photo.attach(post_params[:photo])
  # end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :user_id, :photo, :like, :dislike)
  end


end
