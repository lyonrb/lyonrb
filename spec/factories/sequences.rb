Factory.sequence :email do |n|
  "testing#{n}@example.com"
end

Factory.sequence :name do |n|
  "Object Named ##{n}"
end


Factory.sequence :permalink do |n|
  "permalink-#{n}"
end