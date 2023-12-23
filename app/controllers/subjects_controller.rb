class SubjectsController < ApplicationController
  include Paginator, BreadcrumbPaths
  def index
    @categories = Category.all
  end

  def new
    @category = Category.find(params[:category_id])
    @subject = @category.subjects.build
  end

  def show
    @subject = Subject.find(params[:id])
    @posts = set_pagination(6, @subject.posts.order(created_at: :desc), true)
    prepare_breadcrumbs
  end

  def create
    @category = Category.find(params[:category_id])
    @subject = @category.subjects.build(subject_params)
    if @subject.save
      respond_to do |format|
        format.html { redirect_to root_url }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @subject = @category.subjects.find(params[:id])
    @subject.destroy
    if @subject.destroyed?
      respond_to do |format|
        format.html { redirect_to root_url }
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@subject)}
      end
    end
  end

  private
    def subject_params
      params.require(:subject).permit(:title, :description)
    end
end
