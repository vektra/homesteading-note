require 'spec_helper'

describe "statuses/index.html.erb" do
  before(:each) do
    assign(:status, stub_model(Status))

    assign(:statuses, [
      stub_model(Status,
        :content => "Content",
        :updated_at => Time.now
      ),
      stub_model(Status,
        :content => "Content",
        :updated_at => Time.now
      )
    ])
  end

  it "renders a list of statuses" do
    render
    assert_select ".entry-content", :text => "Content".to_s, :count => 2
  end
end
