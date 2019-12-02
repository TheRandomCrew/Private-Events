require 'rails_helper'

describe "GET '/sessions/new'", :type => :feature do
  it 'Shows the sign in form' do
    visit('/sessions/new')
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    puts 'You can enter credentials here'
  end
end

describe "Must be signed in to enter", :type => :feature do
  it 'Shows error when no authenticated' do
    visit '/events'
    expect(page).to have_content("Sign in")
    puts 'You must enter credentials before seeing any event'
  end
end

describe "the signin process", type: :feature do
  before :each  do
    User.create(name: 'Israel Laguan', email: 'israel@email.com', password: 'password', password_confirmation: 'password')
  end

  it "Sign in when correct credentials" do
    visit '/sessions/new'
    find('#signin-email').fill_in('sessions_email', with: 'israel@email.com')

    within("#signin-password") do
      fill_in 'sessions_password', with: 'password'
    end
    sleep(2)
    click_button 'Sign in'
    sleep(5)
    expect(page).to have_content 'Logged in'
  end

  it 'Sign out' do
    visit '/sessions/new'
    find('#signin-email').fill_in('sessions_email', with: 'israel@email.com')

    within("#signin-password") do
      fill_in 'sessions_password', with: 'password'
    end
    click_button 'Sign in'
    visit 'signout'
    sleep(5)
    expect(page).to have_content 'Logged out'
  end
end
