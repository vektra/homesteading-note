require 'spec_helper'

describe "statuses/show.html.erb" do
  before(:each) do
    assign(:status,
      stub_model(Status,
        :content => "Content",
        :updated_at => Time.now
      )
    )
  end

  it "renders a status" do
    render
    assert_select ".entry-content", :text => "Content".to_s
  end
end
