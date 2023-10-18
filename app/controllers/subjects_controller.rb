class SubjectsController < ApplicationController
  include Paginator
  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
    set_pagination(8, @subject.posts)
  end
end
