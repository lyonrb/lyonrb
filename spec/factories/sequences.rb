Factory.sequence :email do |n|
  "testing#{n}@example.com"
end

Factory.sequence :name do |n|
  "Object Named ##{n}"
end
