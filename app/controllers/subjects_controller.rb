class SubjectsController < ApplicationController
  include Paginator, BreadcrumbPaths
  def index
    @categories = Category.all
  end

  def show
    @subject = Subject.find(params[:id])
    set_pagination(8, @subject.posts)
    prepare_breadcrumbs
  end
end
