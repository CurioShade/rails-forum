class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      @last_page = @post.comments.max_pages(2)
      respond_to do |format|
        format.html {redirect_to post_path(@post).concat("?page=#{@last_page}")}
        format.turbo_stream
      end
    else
      render partial: "comments/form", locals: {post: [@post, @comment]},
      status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
