require "spec_helper"

describe "notes/new" do
  before(:each) do
    assign(:note, stub_model(Note,
      :content => "MyText",
      :in_reply_to => "MyText",
      :private => false
    ).as_new_record)
  end

  it "renders new note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => notes_path, :method => "post" do
      assert_select "textarea#note_content", :name => "note[content]"
      assert_select "textarea#note_in_reply_to", :name => "note[in_reply_to]"
      assert_select "input#note_private", :name => "note[private]"
    end
  end
end
