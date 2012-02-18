Factory.define :user do |user|
  user.name                  "Tomislav Dyulgerov"
  user.email                 "tommy@example.com"
  user.password              "password"
  user.password_confirmation "password"
end

Factory.define :project do |project|
  project.title "Example Project"
end
