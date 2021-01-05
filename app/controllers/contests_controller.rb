class ContestsController < ApplicationController

    before_action :user_signed_in?
    helper_method :current_user
    
    def index
        @contest = Contest.all
    end
    
    def show
        @contest = Contest.find(params[:id])
        @question = Question.where(:contest => @contest.id) 
        @answers_of_users = Answer.where(:question => @question.ids)
        @key = Key.where(:question => @question.ids)
        @leaderboard_contest = @contest
        @leaderboard_contest.users_answer = @answers_of_users
        @leaderboard_contest.answer_key = @key
        @leaderboard_contest = @leaderboard_contest.leadboard
    end
    
    def new
        if can? :create, @contest
            @contest = Contest.new
        else 
            redirect_to contests_path
        end
    end

    def edit
        if can? :create, @contest
            @contest = Contest.find(params[:id])
        else
            redirect_to contests_path
        end
    end

    def create
        if can? :create, @contest
            @contest = Contest.new(contest_params)
            if @contest.save
                redirect_to @contest
            else
                render 'new'
            end
        else
            redirect_to contests_path
        end
    end

    def update
        if can? :create, @contest
            @contest = Contest.find(params[:id])
        
            if @contest.update(contest_params)
            redirect_to @contest
            else
            render 'edit'
            end
        else
            redirect_to contests_path
        end
    end

    def destroy
        if can? :create, @contest
            @contest = Contest.find(params[:id])
            @contest.destroy
        end
        redirect_to contests_path
    end

    private
        def contest_params
            params.require(:contest).permit(:title, :text, :is_ended)
        end
end
