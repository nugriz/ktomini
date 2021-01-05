class AnswersController < ApplicationController

    before_action :user_signed_in?
    helper_method :current_user
    
    def create
        @question = Question.find(params[:question_id])
        @answer = current_user.answers.create!(answer_params)
        @contest = @question.contest
        redirect_to @contest
    end

    def destroy
      @question = Question.find(params[:question_id])
      @answer = @question.answers.find_by(:user => current_user.id).destroy
      @contest = @question.contest
      redirect_to @contest
    end

    private
        def answer_params
          params.require(:answer).permit(:answer, :question).merge({question: @question})
        end
end
