class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comments = Comment.all
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to comments_path }
        format.js
      else
        format.html { render :index }
        format.js
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
