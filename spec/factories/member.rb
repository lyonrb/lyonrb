Factory.define :member do |u|
  u.email { Factory.next(:email) }
  u.password "testing"
  u.password_confirmation "testing"
end
