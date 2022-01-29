class TopicsController < ApplicationController
  before_action only:%i[edit update destroy] do
    validate_permission!(set_topic.user)  
  end 

  def index
    @forums = Forum.all
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topic.new
  end

  def edit
  end

  def create
    @forum = Forum.find(params[:forum_id]) 
    @topic = @forum.topic.new(topic_params)
    @topic.user = current_user

    if @topic.save
      flash[:notice] = "Konu başarıyla eklendi"
      redirect_to "/"
    else
      flash[:error] = "Konu oluşturmada hata meydana geldi"
      render :new
    end
  end
  private
  def topic_params
    params.require(:topic).permit(:title,:body)
  end
end
