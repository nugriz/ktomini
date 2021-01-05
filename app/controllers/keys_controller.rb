class KeysController < ApplicationController

    before_action :user_signed_in?
    helper_method :current_user
    
    def create
        @question = Question.find(params[:question_id])
        @contest = @question.contest_id
        if can? :create, @contest
          @key = @question.keys.create(key_params)
        end
        redirect_to edit_contest_question_path(@contest, @question.id)
    end

    def edit
        @question = Question.find(params[:question_id])
        @key = @question.keys.find(params[:id])
    end

    def update
        @question = Question.find(params[:question_id])
        @key = @question.keys.find(params[:id])
     
        if @key.update(key_params)
          redirect_to @question
        else
          render 'edit'
        end
    end
    
    def destroy
        @question = Question.find(params[:question_id])
        @key = @question.keys.find(params[:id])
        @contest = @question.contest
        @key.destroy
        redirect_to edit_contest_question_path(@contest,@question)
    end

    private
        def key_params
          params.require(:key).permit(:key)
        end
end
