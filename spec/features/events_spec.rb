RSpec.describe 'Hello world', type: :feature do
    scenario 'Root page' do
      visit root_path
      expect(page).to have_content('Private Events')
    end
  end