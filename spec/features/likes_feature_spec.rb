require 'rails_helper'

feature 'likes' do
  context 'ideas are created with 0 likes' do
    scenario 'creating a new idea' do
      user_one_sign_up
      add_idea
      visit('/ideas')
      expect(page).to have_content '0'
    end
  end

  context 'liking other users ideas' do
    before do
      user_one_sign_up
      add_idea
      user_sign_out
      user_two_sign_up
    end
    scenario 'should increase the like count' do
      visit('/ideas')
      click_link 'like'
      expect(page).to have_content '1'
    end

    scenario 'should only increase the like count once' do
      visit('/ideas')
      click_link 'like'
      click_link 'like'
      expect(page).to have_content '1'
    end
  end
end