require "spec_helper"

describe "Notes" do
  describe "GET /notes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get notes_path
      response.note.should be(200)
    end
  end
end