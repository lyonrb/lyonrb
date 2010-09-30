Factory.define :page do |u|
  u.title       "Ma Page"
  u.permalink   { Factory.next(:permalink) }
  u.content     "Le contenu de ma page"
end
