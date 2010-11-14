# encoding: UTF-8
Factory.define :category do |u|
  u.title { Factory.next(:title) }
end