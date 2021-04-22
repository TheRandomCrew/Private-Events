class AnswersController < ApplicationController
  before_action :set_comment
  before_action :auth_user?

  def create
    @answer = @comment.answers.new(answer_params)
    @answer.user = current_user
    @answer.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @answer = @comment.answers.find(params[:id])
    @answer.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :comment_id)
  end
  

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
  
end
