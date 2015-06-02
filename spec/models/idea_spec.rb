require 'spec_helper'

describe Idea, type: :model do

  it 'is not valid with a name of less than three characters' do
    idea = Idea.new(name: 'kf')
    expect(idea).to have(1).error_on(:name)
    expect(idea).not_to be_valid
  end

end