class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:commenter, :body))
    @comments = @post.comments.sort_by{|c| c.body.length}.reverse
    respond_to do |format|
      format.json {render :json => {comments: @comments}}
      format.html {redirect_to post_path(@post)}
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
