class PostsController < ApplicationController
  include Paginator, BreadcrumbPaths
  def create
    @subject = Subject.find(params[:subject_id])
    @post = @subject.posts.build(post_params.merge(user: current_user))
    if @post.save
      respond_to do |format|
        format.html {redirect_to post_path(@post)}
        format.turbo_stream
      end
    else
      render partial: "posts/form", locals: {subject: @subject,
      post: @post}, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    set_pagination(2, @post.comments)
    prepare_breadcrumbs
  end

  def destroy
    @subject = Subject.find(params[:subject_id])
    @post = @subject.posts.find(params[:id])
    @post.destroy
    redirect_to subject_path(@subject)
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
