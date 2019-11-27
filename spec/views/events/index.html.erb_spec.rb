require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :date => "Date",
        :location => "Location",
        :description => "MyText"
      ),
      Event.create!(
        :date => "Date",
        :location => "Location",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Date".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
