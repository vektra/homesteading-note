require "spec_helper"

describe "notes/show" do
  before(:each) do
    @note = assign(:note, stub_model(Note,
      :content => "MyText",
      :in_reply_to => "MyText",
      :private => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
