module SettingsHelper
  def setting(name)
    Setting.where(name: name).first.content
  end
end
