class CommentsController < ApplicationController
   before_action :authenticate_user! 
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render :index
    end
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.comments.find(params[:id])
    if @comment.user != current_user
      redirect_to request.referer
    end
    if @comment.destroy
      render :index
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
