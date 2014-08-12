require 'rails_helper'

feature 'Commenting' do
  scenario 'Adding a comment' do
    visit comments_path

    fill_in 'Author', with: 'Jano'
    fill_in 'Body', with: 'Text'
    click_button 'Create Comment'

    expect(page).to have_content('Jano: Text')
  end

  scenario 'Adding a comment via JS', js: true do
    visit comments_path
    fill_in 'Author', with: 'Jano'
    fill_in 'Body', with: 'Text'
    click_button 'Create Comment'

    expect(page).to have_content('Jano: Text')
  end
end
