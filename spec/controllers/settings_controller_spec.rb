require "spec_helper"

describe SettingsController, type: :controller do
  describe "GET index" do
    let!(:non_editable_setting) { Fabricate(:setting, editable: false) }
    let!(:editable_setting) { Fabricate(:setting, editable: true) }
    before { get :index }

    it "assings @settings to editable settings" do
      expect(assigns(:settings).to_a).to eq [editable_setting]
    end

    it "assigns @page_title" do
      expect(assigns(:page_title)).to eq "Settings"
    end

    it "renders the index template" do
      expect(response).to render_template "index"
    end
  end

  describe "GET show" do
    let!(:setting) { Fabricate(:setting, editable: true) }
    before { get :show, id: setting.id }

    it "assings @settings to editable settings" do
      expect(assigns(:settings).to_a).to eq [setting]
    end

    it "assigns @setting" do
      expect(assigns(:setting)).to eq setting
    end

    it "redirects to settings" do
      expect(response).to redirect_to settings_path
    end
  end

  describe "GET edit" do
    let!(:setting) { Fabricate(:setting, editable: true) }
    before { get :edit, id: setting.id }

    it "assings @settings to editable settings" do
      expect(assigns(:settings).to_a).to eq [setting]
    end

    it "assigns @setting" do
      expect(assigns(:setting)).to eq setting
    end

    it "assigns @page_title" do
      expect(assigns(:page_title)).to eq "Editing Setting : #{setting.name}"
    end

    it "renders the edit template" do
      expect(response).to render_template "edit"
    end
  end

  describe "PATCH update" do
    let!(:setting) { Fabricate(:setting, editable: true) }

    it "assings @settings to editable settings" do
      patch :update, id: setting.id, setting: { name: "updated_setting_name"}
      expect(assigns(:settings).to_a).to eq [setting]
    end

    it "assigns @setting" do
      patch :update, id: setting.id, setting: { name: "updated_setting_name"}
      expect(assigns(:setting)).to eq setting
    end

    context "when update is successful" do
      before { Setting.any_instance.stub(:update) { true } }
      before { patch :update, id: setting.id, setting: { name: "updated_setting_name"} }

      it "redirects to settings" do
        expect(response).to redirect_to settings_path
      end
    end

    context "when update is unsuccessful" do
      before { Setting.any_instance.stub(:update) { false } }
      before { patch :update, id: setting.id, setting: { name: "updated_setting_name"} }

      it "renders edit template" do
        expect(response).to render_template "edit"
      end
    end
  end
end
