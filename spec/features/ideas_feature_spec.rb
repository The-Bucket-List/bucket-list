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
end