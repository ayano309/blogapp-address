class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to book_path(@book), notice: 'comment created'
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    comment = @book.comments.find(params[:id])
    if comment.user != current_user
      redirect_to request.referer
    end
    comment.destroy
    redirect_to request.referer
   
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
