require 'rails_helper'

RSpec.describe User, :type => :model do
    subject {
      described_class.new(username: "Anything",
                          fullname: "Lorem ipsum",
                          password_digest: "anything"
                          )
    }
  
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  
    it "is not valid without a username" do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a fullname" do
        subject.fullname = nil
        expect(subject).to_not be_valid
      end
  end