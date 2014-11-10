describe "User API" do
  it '#index all users' do
    FactoryGirl.create_list(:user, 10)
    get '/users'
    expect(response).to be_success            # test for the 200 status-code
    json = JSON.parse(response.body)
    expect(json.length).to eq(10) # check to make sure the right amount of messages are returned
  end

  it 'retrieves a specific user' do
    user = FactoryGirl.create(:user)
    get "/users/#{user.id}.json"

    # test for the 200 status-code
    expect(response).to be_success

    json = JSON.parse(response.body)

    # check that the message attributes are the same.
    expect(json['name']).to eq(user.name)
    expect(json['email']).to eq(user.email)
    expect(json['password_digest']).to eq(user.password_digest)
    expect(json['access_token']).to eq(user.access_token)
    expect(json['token_scope']).to eq(user.token_scope)
    expect(json['token_expired_at']).to eq(user.token_expired_at)
    expect(json['token_created_at']).to eq(user.token_created_at)
  end
end
