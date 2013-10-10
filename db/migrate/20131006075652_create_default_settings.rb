class CreateDefaultSettings < ActiveRecord::Migration
  def up
    [
      ["Author Name", "",     true ],
      ["Author URL",  "",     true ],
      ["Hub URL",     "/",    true ],
      ["Site Title",  "",     true ],
      ["Post Type",   "note", false]
    ].each do |setting|
      s          = Setting.new
      s.name     = setting[0]
      s.key      = setting[0].downcase.gsub(/\W/, "_")
      s.content  = setting[1]
      s.editable = setting[2]
      s.save(:validate => false)
    end
  end

  def down
    Setting.all.each do |s|
      s.destroy
    end
  end
end
