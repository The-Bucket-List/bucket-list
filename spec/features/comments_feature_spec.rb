require 'rails_helper'

feature 'comments' do

  context 'an idea has been added' do
    xscenario 'should display the number of comments on an idea' do
      user = create(:user)
      idea = create(:idea)
      comment = create(:comment)
      visit 'ideas'
      expect(page).to have_content '1'
    end
  end
end
