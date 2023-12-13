class PostsController < ApplicationController
  include Paginator, BreadcrumbPaths
  def create
    @subject = Subject.find(params[:subject_id])
    @post = @subject.posts.build(post_params.merge(user: current_user))
    if @post.save
      redirect_to subject_path(@subject)
    end
  end

  def show
    @post = Post.find(params[:id])
    set_pagination(2, @post.comments)
    prepare_breadcrumbs
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
