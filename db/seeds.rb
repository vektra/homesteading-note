# creates the default settings with empty values
# the site owner will need to populate those with real values
puts "Creating default settings..."
[
  ["Author Name",                  "",                                   true ],
  ["Author URL",                   "",                                   true ],
  ["Hub URL",                      "/",                                  true ],
  ["Site Title",                   "",                                   true ],
  ["Site Description",             "",                                   true ],
  ["Long Domain",                  "",                                   true ],
  ["Short Domain",                 "",                                   true ],
  ["Twitter Username",             "",                                   true ],
  ["Post Type",                    "note",                               false],
  ["Post Short Code",              "n",                                  false],
  ["Rel Authorization Endpoint",   "https://indieauth.com/auth",         true ],
  ["Rel Token Endpoint",           "https://tokens.indieauth.com/token", true ],
  ["Rel Me",                       "",                                   true ]
].each do |setting|
  s          = Setting.new
  s.name     = setting[0]
  s.key      = setting[0].downcase.gsub(/\W/, "_")
  s.content  = setting[1]
  s.editable = setting[2]
  s.save(validate: false)
end
puts "...done."


puts "Populating licenses table..."
[
  [
    "Public Domain",
    "CC0",
    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    "http://creativecommons.org/publicdomain/zero/1.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY",
    "Attribution",
    "http://creativecommons.org/licenses/by/4.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY-SA",
    "Attribution Share Alike",
    "http://creativecommons.org/licenses/by-sa/4.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY-ND",
    "Attribution No Derivatives",
    "http://creativecommons.org/licenses/by-nd/4.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY-NC",
    "Attribution Non-Commercial",
    "http://creativecommons.org/licenses/by-nc/4.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY-NC-SA",
    "Attribution Non-Commercial Share Alike",
    "http://creativecommons.org/licenses/by-nc-sa/4.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY-NC-ND",
    "Attribution Non-Commercial No Derivatives",
    "http://creativecommons.org/licenses/by-nc-nd/4.0/"
  ],
  [
    "All Rights Reserved",
    "&copy;",
    "",
    ""
  ],
].each do |license|
  l             = License.new
  l.name        = license.first
  l.short_code  = license[1]
  l.description = license[2]
  l.url         = license.last
  l.save!
end
puts "...done."


puts "Settting copyright (All Rights Reserved) as default license..."
license          = Setting.new
license.name     = "License"
license.key      = "license"
license.content  = License.find_by(name: "All Rights Reserved").id
license.editable = true
license.save(validate: false)
puts "...done."
