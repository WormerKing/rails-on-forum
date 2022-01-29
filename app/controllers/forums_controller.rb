class ForumsController < ApplicationController
  def index
    @forums = Forum.all
    @topics = Topic.order(updated_at: :desc)
  end

  def show
    @forums = Forum.all
    @forum = Forum.find(params[:id])
    @konular = Topic.where(forum:Forum.find(params[:id]))
  end
end
