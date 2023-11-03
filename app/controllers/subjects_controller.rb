class SubjectsController < ApplicationController
  include Paginator
  def index
    @categories = Category.all
  end

  def show
    @subject = Subject.find(params[:id])
    set_pagination(8, @subject.posts)
  end
end
