class PostCommentsController < ApplicationController
  def create
    customer = Customer.find(params[:customer_id])
    comment = current_member.post_comments.new(post_comment_params)
    comment.customer_id = customer.id
    comment.save
    redirect_to customer_path(customer)
  end

  def destroy
    PostComment.find_by(id: params[:id], customer_id: params[:customer_id]).destroy
    redirect_to customer_path(params[:customer_id])
  end
  
  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
