require 'rails_helper'

RSpec.describe Contest, :type => :model do
    subject {
      described_class.new(title: "Anything",
                          text: "Lorem ipsum",
                          is_ended: true
                          )
    }
  
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  
    it "is not valid without a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    #test leaderboard
    it "is create leaderboard descendently" do
      contest = Contest.create(title: "Anything",
                                text: "Lorem ipsum",
                                is_ended: true
                                )
      user1 = User.create(username: "userx",
                          fullname: "user1",
                          password_digest: "123456")
      user2 = User.create(username: "kiriz",
                          fullname: "kiriz",
                          password_digest: "123456")
      question = Question.create(quest: "1+1",
                                 contest_id: contest.id)
      key = Key.create(key: "2",
                       question_id: question.id)
      answer1 = Answer.create(question_id: question.id,
                              user_id: user1.id,
                              answer: "1")
      answer2 = Answer.create(question_id: question.id,
                              user_id: user2.id,
                              answer: "2")
      contest.users_answer = Answer.where(:question => question.id)
      contest.answer_key = Key.where(:question => question.id)
      contest.leadboard
      expect(contest.leadboard[0][0]).to eq(user2.id)
      expect(contest.leadboard[1][0]).to eq(user1.id)
    end
    
  end