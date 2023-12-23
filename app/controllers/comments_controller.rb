class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      @post.touch
      @last_page = @post.comments.max_pages(2)
      respond_to do |format|
        format.html {redirect_to post_path(@post).concat("?page=#{@last_page}")}
        format.turbo_stream
      end
    else
      render partial: "comments/form", locals: {post: @post, comment: @comment},
      status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    if @comment.destroyed?
      redirect_to post_path(@post)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
