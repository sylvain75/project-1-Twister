class CommentsController < ApplicationController
  def create
    twist = Twist.find params[:twist_id]
    comment = Comment.create comment_params
    twist.comments << comment
    @current_user.comments << comment
    redirect_to show_twist_path(twist)
  end

 def update
   
 end

 def destroy
   @comment.destroy
   flash[:success] = "Comment deleted"
   # redirect_to request.referrer || root_url
 end

 private

   def comment_params
     params.require(:comment).permit(:comment)
   end

   def correct_user
     # @comment = current_user.comments.find_by(id: params[:id])
     # redirect_to root_url if @comment.nil?
   end
end
