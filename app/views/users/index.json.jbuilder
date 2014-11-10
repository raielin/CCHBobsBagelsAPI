json.users @users do |user|
  json.name user.name
  json.password_digest user.password_digest
  json.token_scope user.token_scope
end
