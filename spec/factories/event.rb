Factory.define :event do |u|
  u.name { Factory.next(:name) }
  u.start_at   { 1.day.from_now }
  u.address "6 rue du Boeuf, Lyon 5e arrondissement"
  u.place_name { Factory.next(:name) }
end
