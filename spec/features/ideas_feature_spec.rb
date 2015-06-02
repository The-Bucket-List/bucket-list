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

  context 'viewing ideas' do

    let!(:lions_tour){Idea.create(name:'Lions tour')}

    scenario 'lets a user view an idea' do
     visit '/ideas'
     click_link 'Lions tour'
     expect(page).to have_content 'Lions tour'
     expect(current_path).to eq "/ideas/#{lions_tour.id}"
    end
  end

  context 'editing ideas' do

    before {Idea.create name: 'Lions tour'}

    scenario 'let a user edit an idea' do
      visit '/ideas'
      click_link 'Lions tour'
      click_link 'Edit'
      fill_in 'Name', with: 'Lions tour to New Zealand'
      click_button 'Update Idea'
      expect(page).to have_content 'Lions tour to New Zealand'
      expect(current_path).to eq '/ideas'
    end

  end
end