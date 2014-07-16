# creates the default settings with empty values
# the site owner will need to populate those with real values
puts "Creating default settings..."
[
  ["Author Name",       "",     true ],
  ["Author URL",        "",     true ],
  ["Hub URL",           "/",    true ],
  ["Site Title",        "",     true ],
  ["Site Description",  "",     true ],
  ["Long Domain",       "",     true ],
  ["Short Domain",      "",     true ],
  ["Twitter Username",  "",     true ],
  ["Post Type",         "note", false],
  ["Post Short Code",   "n",    false]
].each do |setting|
  s          = Setting.new
  s.name     = setting[0]
  s.key      = setting[0].downcase.gsub(/\W/, "_")
  s.content  = setting[1]
  s.editable = setting[2]
  s.save(validate: false)
end
puts "Default settings created."
