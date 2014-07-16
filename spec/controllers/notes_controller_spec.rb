require "spec_helper"

describe NotesController, type: :controller do
  describe "GET index" do
    it "assigns @page_title" do
      get :index
      expect(assigns(:page_title)).to eq "Notes"
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template "index"
    end

    context "when page param is blank" do
      before { 6.times { Fabricate(:note) } }
      before { get :index }

      it "assings @posts to be 5 most recent notes" do
        expect(assigns(:posts).to_a).to eq(
          Note.unscoped.order("published_at DESC").limit(5))
      end
    end

    context "when page param is present" do
      before { 6.times { Fabricate(:note) } }
      before { get :index, page: "2" }

      it "assings @posts to be 5 most recent notes after (page number * 5)" do
        expect(assigns(:posts).to_a).to eq(
          [Note.unscoped.order("published_at DESC").last])
      end
    end
  end

  describe "GET show" do
    let!(:note) { Fabricate(:note) }
    before { get :show, year: note.year, month: note.month,
      day: note.month, slug: note.slug }

    it "assigns @post" do
      expect(assigns(:post)).to eq note
    end

    it "assigns @page_title" do
      expect(assigns(:page_title)).to eq note.name
    end

    it "renders the show template" do
      expect(response).to render_template "show"
    end
  end

  describe "GET new" do
    before { get :new }

    it "assigns @post" do
      expect(assigns(:post)).to be_a Note
    end

    it "assigns @page_title" do
      expect(assigns(:page_title)).to eq "New Note"
    end

    it "renders the new template" do
      expect(response).to render_template "new"
    end
  end

  describe "GET edit" do
    let!(:note) { Fabricate(:note) }
    before { get :edit, year: note.year, month: note.month,
      day: note.month, slug: note.slug }

    it "assigns @post" do
      expect(assigns(:post)).to eq note
    end

    it "assigns @page_title" do
      expect(assigns(:page_title)).to eq "Editing Note - #{note.name}"
    end

    it "renders the edit template" do
      expect(response).to render_template "edit"
    end
  end

  describe "POST create" do
    let!(:note) { Fabricate.build(:note) }

    context "when create is successful" do
      before { Note.any_instance.stub(:save) { true } }
      before { post :create, year: note.year, month: note.month,
      day: note.month, slug: note.slug, note: { title: "Update note title"} }

      it "redirects to notes" do
        expect(response).to redirect_to notes_path
      end
    end

    context "when create is unsuccessful" do
      before { Note.any_instance.stub(:save) { false } }
      before { post :create, year: note.year, month: note.month,
      day: note.month, slug: note.slug, note: { title: "Update note title"} }

      it "renders edit template" do
        expect(response).to render_template "new"
      end
    end
  end

  describe "PATCH update" do
    let!(:note) { Fabricate(:note) }

    it "assigns @post" do
      patch :update, year: note.year, month: note.month,
      day: note.month, slug: note.slug, note: { title: "Update note title"}
      expect(assigns(:post)).to eq note
    end

    context "when update is successful" do
      before { Note.any_instance.stub(:update) { true } }
      before { patch :update, year: note.year, month: note.month,
      day: note.month, slug: note.slug, note: { title: "Update note title"} }

      it "redirects to notes" do
        expect(response).to redirect_to notes_path
      end
    end

    context "when update is unsuccessful" do
      before { Note.any_instance.stub(:update) { false } }
      before { patch :update, year: note.year, month: note.month,
      day: note.month, slug: note.slug, note: { title: "Update note title"} }

      it "renders edit template" do
        expect(response).to render_template "edit"
      end
    end
  end
end
