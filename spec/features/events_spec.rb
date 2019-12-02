RSpec.describe 'Events', type: :feature do
  describe "You can see all the events", :type => :feature do
    before :each  do
      User.create(name: 'Israel Laguan', email: 'israel@email.com', password: 'password', password_confirmation: 'password')
    end
    it 'Creates an event' do
      visit '/sessions/new'
      find('#signin-email').fill_in('sessions_email', with: 'israel@email.com')
  
      within("#signin-password") do
        fill_in 'sessions_password', with: 'password'
      end
      click_button 'Sign in'
      visit '/events/new'
      fill_in('Date', with: Time.zone.now)
      fill_in('Location', with: 'Near you')
      fill_in('Description', with: 'My fancy event')
      click_button 'Submit'
      sleep(5)
      expect(page).to have_content("successfully created")
    end
  end
end