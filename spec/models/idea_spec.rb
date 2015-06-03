require 'rails_helper'

describe Idea, type: :model do

  it { is_expected.to have_many :likes }
  it { is_expected.to belong_to :user }

  it 'is not valid with a name of less than three characters' do
    idea = Idea.new(name: 'kf')
    expect(idea).to have(1).error_on(:name)
    expect(idea).not_to be_valid
  end

  it 'is not valid unless it has a unique name' do
    Idea.create(name: 'Lions Tour')
    idea = Idea.new(name: 'Lions Tour')
    expect(idea).to have(1).error_on(:name)
  end

  it 'has a no likes when created' do
    idea = Idea.create(name: 'Lions Tour')
    expect(idea.likes_number).to eq 0
  end

  it 'keeps track of the number of likes' do
    idea = Idea.create(name: 'Lions Tour')
    user = User.create(email: 'test@test.com', password: 'password')
    like = Like.create(user_id: user.id, idea_id: idea.id, value: 1)
    expect(idea.likes_number).to eq 1
  end

end