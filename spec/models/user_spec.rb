require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  it {is_expected.to have_secure_password}
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email)}
  it do
    should validate_length_of(:password).
    is_at_least(3)
  end


  it { should have_many(:attended_events) }
  
end
