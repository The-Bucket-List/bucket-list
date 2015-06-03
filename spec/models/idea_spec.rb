require 'spec_helper'

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

end