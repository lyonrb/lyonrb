Factory.define :member do |u|
  u.email { Factory.next(:email) }
  u.password "testing"
  u.password_confirmation "testing"
end

Factory.define :admin, :class => 'Member' do |u|
  u.email { Factory.next(:email) }
  u.admin true
  u.password "testing"
  u.password_confirmation "testing"
end