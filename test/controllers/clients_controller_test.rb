require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    #sign_in_user_admin
    @clientone = clients(:one)
    @clienttwo = {
        client_name: 'Tedeeee',
        client_id: 1,
        address: '1000 Test Ave.',
        city: 'Testing',
        state: 'CO',
        zip: '12345',
        email: 'dom@test.com',
        company: 'Test Inc.',
        notes: 'test test test',
        phone: '111-222-3333',
        fax: '111-222-3333',
    }
    @clientthree = clients(:two)
    # @clientthree = {
    #   client_name: 'Alpha Dog',
    #   status: false,
    #   address: '123 Main St',
    #   city: 'Denver',
    #   state: 'CO',
    #   zip: '90210',
    #   email: 'alphadog@email.com',
    #   company: 'ABC Company',
    #   notes: 'asdfasdf',
    #   phone: '123-456-7890',
    #   fax: '123-456-7890',
    #   client_id: 1,
    # }
    @update = {
        client_name: 'Test Testing',
        address: '1000 Test Ave.',
        city: 'Testing',
        state: 'CO',
        zip: '12345',
        email: 'domin@test.com',
        company: 'Test Inc.',
        notes: 'test test test',
        phone: '111-222-3333',
        fax: '111-222-3333',
    }
    @invalidClient = {
      address: 123,
      city: "Nowhere City",
      client_id: 2,
      client_name: "Invalid User",
      company: "ABC Company",
      email: 123,
      fax: 123,
      notes: "invalid entry",
      phone: 123,
      state: "CO",
      status: 1,
      total_requests: 2,
      zip: "90210",
    }
  end

  test "should get index for admin user" do
    sign_in_user_admin
    get clients_url
    assert_response :success
  end

  test "should get index normal user" do
    sign_in_normal_user
    # OmniAuth.config.mock_auth[:auth0] = OmniAuth::AuthHash.new({
    #   :provider => 'auth0',
    #   :uid => 'google-oauth2|113828971320495757925',
    #   :info => {
    #     :name => "test",
    #     :first_name => "test",
    #     :nickname => "test",
    #     :email => "dom@test.com"
    #   },
    #   :extra => {
    #     :raw_info => {
    #       :given_name => "test"
    #     }
    #   }
    # })
    # Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:auth0]
    # get auth_auth0_callback_path
    # post firms_url, params: { client: @clienttwo }
    get clients_url
    assert_response :success
  end

  test "should get new" do
    sign_in_user_admin
    get new_client_url
    assert_response :success
  end

  # new test for normal users (the set up method logs in as admin)
  test "normal user can create client without status" do
    # sign_in_user_admin
    # get logout_url
    sign_in_normal_user
    assert_difference('Client.count') do
      post clients_url, params: { client: {
        client_name: "MyString",
        total_requests: 1,
        company: "MyString",
        email: "MyString@mystring.com",
        address: "MyString",
        city: "MyString",
        state: "CO",
        zip: "11111",
        phone: "504-504-5045",
        fax: "504-504-5045",
        notes: "MyString",
        client_id: 1
        }
      }
    end
  end

  test "should create client" do
    sign_in_user_admin
    assert_difference('Client.count') do
      #post clients_url, params: { client: { address: @client.address, city: @client.city, client_id: @client.client_id, client_name: @client.client_name, company: @client.company, email: @client.email, fax: @client.fax, notes: @client.notes, phone: @client.phone, state: @client.state, status: @client.status, total_requests: @client.total_requests, zip: @client.zip } }
      post clients_url, params: { client: {
        client_name: "MyString",
        status: false,
        total_requests: 1,
        company: "MyString",
        email: "MyString@mystring.com",
        address: "MyString",
        city: "MyString",
        state: "CO",
        zip: "11111",
        phone: "504-504-5045",
        fax: "504-504-5045",
        notes: "MyString",
        client_id: 1
        }
      }
    end

    assert_redirected_to client_url(Client.last)
  end

  test "should stay on same page if create client is invalid" do
    sign_in_user_admin
    assert_no_difference('Client.count') do
      post clients_url, params: {
        client: @invalidClient
      }
    end

    assert_response 422
  end

  test "should show client for admin user" do
    sign_in_user_admin
    get client_url(@clientone)
    assert_response :success
  end

  test "foo" do
    sign_in_normal_user
    get client_url(@clientthree)
    assert_response :success
  end

  test "should show client for normal user who created that client" do
    sign_in_normal_user
    get client_url(@clientone)
    assert_response :success
  end

  # test "should redirect to clients page for non-auth users" do
  #   get client_url(@clientone)
  #   assert_response 302
  # end

  test "should get edit" do
    sign_in_user_admin
    get edit_client_url(@clientone)
    assert_response :success
  end

  test "should update client" do
    sign_in_user_admin
    patch client_url(@clientone), params: { client: @update }
    assert_redirected_to client_url(@clientone)
  end

  test "should stay on same page if update client is invalid" do
    sign_in_user_admin
    assert_no_changes(@clientone) do
      patch client_url(@clientone), params: {
        client: {
          address: 123,
          city: "Nowhere City",
          client_id: 2,
          client_name: "Invalid User",
          company: "ABC Company",
          email: 123,
          fax: 123,
          notes: "invalid entry",
          phone: 123,
          state: "CO",
          status: 1,
          total_requests: 2,
          zip: "90210"
        }
      }
    end

    assert_response 422
  end

  test "should destroy client" do
    sign_in_user_admin
    assert_difference('Client.count', -1) do
      delete client_url(@clientone)
    end

    assert_redirected_to clients_url
  end
end
