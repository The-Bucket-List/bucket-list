require 'rails_helper'

feature 'ideas' do
  context 'no ideas have been added' do
    scenario 'should display a prompt to add a new idea' do
      visit 'ideas'
      expect(page).to have_content 'No ideas yet'
      expect(page).to have_link 'Add an idea'
    end
  end

  context 'ideas have been added' do
    before do
      Idea.create(name: 'Lions tour')
    end

    scenario 'display ideas' do
      visit '/ideas'
      expect(page).to have_content('Lions tour')
      expect(page).not_to have_content('No ideas yet')
    end
  end

  context 'creating ideas' do
    scenario 'prompts user to fill out a form, then displays the new idea' do
      visit '/ideas'
      click_link 'Add an idea'
      fill_in 'Name', with: 'Lions tour'
      click_button 'Create Idea'
      expect(page).to have_content 'Lions tour'
      expect(current_path).to eq '/ideas'
    end
  end
end