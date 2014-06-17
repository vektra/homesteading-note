require "spec_helper"

describe Setting do
  describe "validations" do
    subject { Fabricate(:setting) }

    it "has a valid fabricator" do
      expect(subject).to be_valid
    end

    it "validates presence of name" do
      subject.name = ""
      expect(subject).not_to be_valid
    end

    it "validates presence of content" do
      subject.content = ""
      expect(subject).not_to be_valid
    end
  end

  describe ".editable" do
    subject { Setting.editable }

    it "includes settings with editable set to true" do
      editable_setting = Fabricate(:setting, editable: true)
      expect(subject).to include(editable_setting)
    end

    it "excludes settings without editable set to true" do
      non_editable_setting = Fabricate(:setting, editable: false)
      expect(subject).not_to include(non_editable_setting)
    end
  end

  describe "#title" do
    subject { Fabricate(:setting, name: "setting_name").title }

    it "replaces underscores with spaces and title cases name" do
      expect(subject).to eq("Setting Name")
    end
  end
end
