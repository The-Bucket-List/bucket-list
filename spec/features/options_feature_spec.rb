require 'rails_helper'

feature 'options' do
  
  before(:each) do
    user_one_sign_up
    add_idea
  end
  
  
  context 'no options have been added' do
    scenario 'should display a prompt to add a new option' do
      visit '/'
      click_link 'Lions tour'
      expect(page).to have_content 'No options yet'
      expect(page).to have_link 'Add an option'
    end
  end

  context 'options have been added' do
    before do
      idea = Idea.create(name: 'Lions Tour idea', description: 'go on the lions tour and have a good old smash up')
      Option.create(name: 'New Zealand', description: 'Go on the NZ lions tour', idea: idea)
    end

    scenario 'display options' do
      visit '/'
      click_link 'Lions Tour idea'
      expect(page).to have_content('New Zealand')
      expect(page).not_to have_content('No options yet')
    end
  end

  context 'creating options' do
    scenario 'prompts user to fill out a form, then displays the new option' do
      visit '/'
      click_link 'Lions tour'
      click_link 'Add an option'
      fill_in 'Name', with: 'Fly out for the whole tour'
      fill_in 'Description', with: 'Fly out for the whole tour and travel with the team and see all matches'
      expect(page).to have_content 'Fly out for the whole tour'
    end

    xcontext 'an invalid option' do
      it 'does not let you submit a name that is too short' do
        user_one_sign_up
        visit '/options'
        click_link 'Add an option'
        fill_in 'Name', with: 'kf'
        click_button 'Create Idea'
        expect(page).not_to have_css 'h2', text: 'kf'
        expect(page).to have_content 'error'
      end
    end
  end

  xcontext 'viewing options' do

    let!(:lions_tour){Idea.create(name:'Lions tour')}

    xscenario 'lets a user view an option' do
     user_one_sign_up
     visit '/options'
     click_link 'Lions tour'
     expect(page).to have_content 'Lions tour'
     expect(current_path).to eq "/options/#{lions_tour.id}"
    end
  end

  xcontext 'editing options' do

    before {Idea.create name: 'Lions tour'}

    scenario 'let a user edit an option' do
      user_one_sign_up
      visit '/options'
      click_link 'Lions tour'
      click_link 'Edit'
      fill_in 'Name', with: 'Lions tour to New Zealand'
      click_button 'Update Idea'
      expect(page).to have_content 'Lions tour to New Zealand'
      expect(current_path).to eq '/options'
    end
  end

  xcontext 'deleting options' do

    before {Idea.create name: 'Lions tour'}

    scenario 'removes an option when a user clicks a delete link' do
      user_one_sign_up
      visit '/options'
      click_link 'Lions tour'
      click_link 'Delete'
      expect(page).not_to have_content 'Lions tour'
      expect(page).to have_content 'Idea deleted successfully'
    end
  end
end
