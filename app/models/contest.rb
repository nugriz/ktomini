class Contest < ApplicationRecord
    has_and_belongs_to_many :users
    has_many  :questions, :dependent=> :destroy
    validates :title, presence: true,
                    length: { minimum: 5 }
    attr_accessor :users_answer, :answer_key
    def leadboard
        list_of_answer = []
        list_of_answer_key = []
        match_user_id = 0
        @users_answer.each do |el|
            list_of_answer.append(el)
        end
        @answer_key.each do |kj|
            list_of_answer_key.append(kj)
        end
        list_of_users_score = [[0, 0]]
        list_of_answer.each do |x|
            list_of_users_score.each do |z|
                if x.user_id == z[0]
                    list_of_answer_key.each do |y|
                        if x.question_id == y.question_id && x.answer == y.key
                            z[1] = z[1] + 1
                        end
                    end
                    match_user_id = match_user_id + 1
                end
            end
            if match_user_id == 0
                list_of_users_score.append([x.user_id, 0])
                list_of_answer_key.each do |y|
                    if x.question_id == y.question_id && x.answer == y.key
                        list_of_users_score.each do |z|
                            if x.user_id == z[0]
                                z[1] = z[1] + 1
                            end
                        end
                    end
                end
            end
            match_user_id = 0
        end
        swapped = true
        while swapped do
            swapped = false
            0.upto(list_of_users_score.size-2) do |i|
                if list_of_users_score[i][1] < list_of_users_score[i+1][1]
                    list_of_users_score[i], list_of_users_score[i+1] = list_of_users_score[i+1], list_of_users_score[i]
                    swapped = true
                end
            end
        end
        list_of_users_score.delete([0,0])
        @contest_leaderboard = list_of_users_score
    end
end
