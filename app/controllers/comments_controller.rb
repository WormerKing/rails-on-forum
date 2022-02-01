class CommentsController < ApplicationController
	before_action :select_comment,only:%i[ edit update destroy ]

	before_action :validate_user!
	before_action only:%i[ edit update destroy ] do
		validate_permission!(select_comment.user)
	end
	def new
		@topic = Topic.find(params[:topic_id])
		@comment = @topic.comments.new
	end
	def create
		@topic = Topic.find(params[:topic_id])
		@comment = @topic.comments.new(comment_params)
		@comment.user = current_user

		if @comment.save
			redirect_to @topic,notice:"Yorumunuz başarıyla eklendi"
		else
			render :new
		end
	end

	def update
		if @comment.update(comment_params)
			redirect_to @comment.topic,notice:"Yorumunuz başarıyla güncellendi"
		else
			render :edit
		end
		#render :edit
	end

	def destroy
		@comment.destroy
		flash[:notice] = "Yorumunuz başarıyla silindi"
		redirect_to @comment.topic
	end
	private
	def comment_params
		params.require(:comment).permit(:body)
	end
	def select_comment
		@comment = Comment.find(params[:id])
	end
end
