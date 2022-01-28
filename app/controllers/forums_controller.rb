class ForumsController < ApplicationController
  def index
    @forumlar = Forum.all
  end

  def show
    @forumlar = Forum.all
    @forum = Forum.find(params[:id])
  end
end
