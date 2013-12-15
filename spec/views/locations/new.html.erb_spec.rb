require 'spec_helper'

describe "locations/new" do
  before(:each) do
    assign(:location, stub_model(Location,
      :lat => 1.5,
      :lon => 1.5,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", locations_path, "post" do
      assert_select "input#location_lat[name=?]", "location[lat]"
      assert_select "input#location_lon[name=?]", "location[lon]"
      assert_select "input#location_name[name=?]", "location[name]"
    end
  end
end
