class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comment.save
    @book_comment_new = BookComment.new
    render 'create.js.erb'
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.find(params[:id])
    @book_comment.destroy
    render 'destroy.js.erb'
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end