require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should have_db_column(:date) }
  it { should have_db_column(:date) }
  it { should have_db_column(:description) }
end
