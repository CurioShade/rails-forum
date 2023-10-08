class PostsController < ApplicationController
  def create
    @subject = Subject.find(params[:subject_id])
    @post = @subject.posts.build(post_params)
    @post.user = current_user
    @post.save
    redirect_to subject_path(@subject)
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
