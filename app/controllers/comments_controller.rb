class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :update, :destroy]
    before_action :authenticate_user!

  def index
    comments = Comment.all
    render json: comments
  end


  def show
    render json: @comment
  end


  def create
    post_id = params[:post_id]
    post = Post.find(post_id) if post_id

    comment = post.comments.build(comment_params)



    # subject = if post_id = params[:post_id]
    #   Post.find(ticket_id)
    # else
    #   raise "Don't know how to create comment for this route"
    # end

    # comment = subject.comments.build(comment_params)

    if comment.save!
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
  end

  private

    def set_comment
      @comment = comment.find(params[:id])
    end


    def comment_params
      params.require(:comment).permit(:remark, :user_id)
    end
end
