class SettingsController < ApplicationController
  before_filter :all_settings

  def index; end

  def show
    redirect_to settings_path
  end

  def edit
    @setting = Setting.find(params[:id])
  end

  def update
    @setting = Setting.find(params[:id])

    if @setting.update_attributes(params[:setting])
      redirect_to settings_path,
      notice: "Setting: was successfully updated. <br /> <b>#{@setting.name}</b> : #{@setting.content}".html_safe
    else
      render action: "edit"
    end
  end

  def all_settings
    @settings = Setting.all
  end
end
