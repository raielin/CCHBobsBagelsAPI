json.users @users do |user|
  json.id user.id
  json.email user.email
  json.access_token user.access_token
  json.name user.name

end
