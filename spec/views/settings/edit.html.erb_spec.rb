require 'spec_helper'

describe "settings/edit" do
  before(:each) do
    @setting = assign(:setting, stub_model(Setting,
      :name => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", setting_path(@setting), "post" do
      assert_select "input#setting_name[name=?]", "setting[name]"
      assert_select "textarea#setting_content[name=?]", "setting[content]"
    end
  end
end
