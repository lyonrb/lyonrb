Factory.define :event do |u|
  u.name { Factory.next(:name) }
  u.when   { 1.day.from_now }
  u.address "Lyon, France"
  u.place_name { Factory.next(:name) }
end
