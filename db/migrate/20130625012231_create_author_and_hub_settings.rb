class CreateAuthorAndHubSettings < ActiveRecord::Migration
  def up
    Setting.create!(name: "author_name", content: "")
    Setting.create!(name: "author_url",  content: "")
    Setting.create!(name: "hub_url",     content: "")
  end

  def down
    Setting.all.each do |s|
      s.destroy
    end
  end
end
