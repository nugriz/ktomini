class QuestionsController < ApplicationController

    before_action :user_signed_in?
    helper_method :current_user
    
    def create
        @contest = Contest.find(params[:contest_id])
        @question = @contest.questions.create(question_params)
        redirect_to contest_path(@contest)
    end

    def edit
        @contest = Contest.find(params[:id])
        @question = @contest.questions.find(params[:contest_id])
    end

    def update
        @contest = Contest.find(params[:contest_id])
        @question = @contest.questions.find(params[:id])
     
        if @question.update(question_params)
          if @question.answer == @question.key
            @question.update(score:1)
          else
            @question.update(score:0)
          end
          redirect_to @contest
        else
          render 'edit'
        end
    end
    
    def destroy
        @contest = Contest.find(params[:id])
        @question = @contest.questions.find(params[:contest_id])
        @question.destroy
        redirect_to contest_path(@contest)
    end

    private
        def question_params
          params.require(:question).permit(:quest, :answer, :key, :score)
        end
end
