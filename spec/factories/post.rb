# encoding: UTF-8
Factory.sequence :title do |n|
  "Title #{n}"
end

Factory.sequence :content do |n|
  "Content #{n}"
end


Factory.define :post do |u|
  u.title { Factory.next(:title) }
  u.content { Factory.next(:content) }
  u.category_id { Factory(:category).id }
  u.published true
  u.published_at 1.second.ago
end

Factory.define :unpublished_post, :class => 'Post' do |u|
  u.title { Factory.next(:title) }
  u.content { Factory.next(:content) }
  u.category_id { Factory(:category).id }
  u.published false
  u.published_at 1.day.ago
end

Factory.define :future_published_post, :class => 'Post' do |u|
  u.title { Factory.next(:title) }
  u.content { Factory.next(:content) }
  u.category_id { Factory(:category).id }
  u.published true
  u.published_at Time.now + 1.day
end