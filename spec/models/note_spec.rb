require "spec_helper"

describe Note do
  describe "validations" do
    subject { Fabricate(:note) }

    it "has a valid fabricator" do
      expect(subject).to be_valid
    end

    it "validates presence of content" do
      subject.content = ""
      expect(subject).not_to be_valid
    end

    it "validates presence of published_at" do
      subject.published_at = ""
      expect(subject).not_to be_valid
    end

    it "validates presence of year" do
      subject.year = ""
      expect(subject).not_to be_valid
    end

    it "validates presence of month" do
      subject.month = ""
      expect(subject).not_to be_valid
    end

    it "validates presence of day" do
      subject.day = ""
      expect(subject).not_to be_valid
    end

    it "validates presence of hour" do
      subject.hour = ""
      expect(subject).not_to be_valid
    end

    it "validates presence of minute" do
      subject.minute = ""
      expect(subject).not_to be_valid
    end

    it "validates presence of second" do
      subject.second = ""
      expect(subject).not_to be_valid
    end

    it "validates presence of slug" do
      subject.slug = ""
      expect(subject).not_to be_valid
    end
  end

  describe "default scope" do
    let!(:published_first) { Fabricate(:note, published_at: 5.minutes.ago) }
    let!(:published_second) { Fabricate(:note, published_at: 5.minutes.from_now) }
    subject { Note.all }

    it "is newer published_at first" do
      expect(subject).to eq [published_second, published_first]
    end
  end

  describe "#path" do
    context "when #published_at is nil" do
      subject { Fabricate.build(:note, published_at: nil).path }

      it "is '/notes'" do
        expect(subject).to eq "/notes"
      end
    end

    context "when #published_at is not nil" do
      let(:note) { Fabricate(:note, published_at: 5.minutes.ago) }
      subject { note.path }

      it "is '/notes/:year/:month/:day/:slug'" do
        year  = note.published_at.year
        month = note.published_at.month.to_s.rjust(2, "0")
        day   = note.published_at.day.to_s.rjust(  2, "0")
        slug  = note.slug
        expect(subject).to eq "/notes/#{year}/#{month}/#{day}/#{slug}"
        
        puts "/notes/#{year}/#{month}/#{day}/#{slug}"
      end
    end
  end

  describe "#params" do
    subject { Fabricate(:note).params }

    it "is year, month, day, and slug" do
      expect(subject.keys).to eq [:year, :month, :day, :slug]
    end
  end

  describe "#public?" do
    context "when #private? is falsey" do
      subject { Fabricate(:note, private: false).public? }

      it "is true" do
        expect(subject).to eq true
      end
    end

    context "when #private? is truthy" do
      subject { Fabricate(:note, private: true).public? }

      it "is false" do
        expect(subject).to eq false
      end
    end
  end

  # describe "#name" do
  #   subject { Fabricate(:note, title: "Note Title", subtitle: "Note subtitle").name }
  #
  #   it "joins title and subtitle with a colon" do
  #     expect(subject).to eq "note Title : note subtitle"
  #   end
  # end
end
