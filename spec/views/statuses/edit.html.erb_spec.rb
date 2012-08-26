require "spec_helper"

describe "statuses/edit" do
  before(:each) do
    @status = assign(:status, stub_model(Status,
      :content => "MyText",
      :in_reply_to => "MyText",
      :private => false
    ))
  end

  it "renders the edit status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => statuses_path(@status), :method => "post" do
      assert_select "textarea#status_content", :name => "status[content]"
      assert_select "textarea#status_in_reply_to", :name => "status[in_reply_to]"
      assert_select "input#status_private", :name => "status[private]"
    end
  end
end
