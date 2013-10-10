class SettingsController < ApplicationController
  before_action :set_setting, only: [:show, :edit, :update]
  before_action :all_settings

  def index
    @page_title = "Settings"
  end

  def show
    redirect_to settings_path
  end

  def edit
    @setting    = Setting.find(params[:id])
    @page_title = "Editing Setting : #{@setting.name}"
  end

  def update
    @setting = Setting.find(params[:id])

    if @setting.update(setting_params)
      redirect_to settings_path,
      notice: "<h4>Setting: was successfully updated.</h4>
               <p><b>#{@setting.name}</b> : #{@setting.content}</p>".html_safe
    else
      render action: "edit"
    end
  end

  private
  def set_setting
    @setting = Setting.find(params[:id])
  end

  def setting_params
    params.require(:setting).permit(:name, :key, :content)
  end

  def all_settings
    @settings = Setting.editable.all
  end
end
