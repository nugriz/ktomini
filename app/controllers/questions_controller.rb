class QuestionsController < ApplicationController

    before_action :user_signed_in?
    helper_method :current_user
    
    def create
        @contest = Contest.find(params[:contest_id])
        if can? :create, @contest
          @question = @contest.questions.create(question_params)
        end
        redirect_to contest_path(@contest)
    end

    def edit
        @contest = Contest.find(params[:contest_id])
        if can? :create, @contest
          @question = @contest.questions.find(params[:id])
        else
          redirect_to contest_path(@contest)
        end
    end

    def update
        @contest = Contest.find(params[:contest_id])
        if can? :create, @contest
          @question = @contest.questions.find(params[:id])
      
          if @question.update(question_params)
            redirect_to @contest
          else
            render 'edit'
          end
        else
          redirect_to contest_path(@contest)
        end
    end
    
    def destroy
        @contest = Contest.find(params[:contest_id])
        if can? :create, @contest
          @question = @contest.questions.find(params[:id])
          @question.destroy
        else
          redirect_to contest_path(@contest)
        end
    end

    private
        def question_params
          params.require(:question).permit(:quest)
        end
end
