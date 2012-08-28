require "spec_helper"

describe "notes/index" do
  before(:each) do
    assign(:notes, [
      stub_model(Note,
        :content => "MyText",
        :in_reply_to => "MyText",
        :private => false
      ),
      stub_model(Note,
        :content => "MyText",
        :in_reply_to => "MyText",
        :private => false
      )
    ])
  end

  it "renders a list of notes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
