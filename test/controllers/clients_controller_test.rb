require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = clients(:one)
    @update = {
        client_name: 'Test Testing',
        address: '1000 Test Ave.',
        city: 'Testing',
        state: 'CO',
        zip: '12345',
        email: 'dom@test.com',
        company: 'Test Inc.',
        notes: 'test test test',
        phone: '111-222-3333',
        fax: '111-222-3333'
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
      zip: "90210"
    }
  end

  test "should get index" do
    get clients_url
    assert_response :success
  end

  test "should get new" do
    get new_client_url
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      #post clients_url, params: { client: { address: @client.address, city: @client.city, client_id: @client.client_id, client_name: @client.client_name, company: @client.company, email: @client.email, fax: @client.fax, notes: @client.notes, phone: @client.phone, state: @client.state, status: @client.status, total_requests: @client.total_requests, zip: @client.zip } }
      post clients_url, params: { client: @update }
    end

    assert_redirected_to client_url(Client.last)
  end

  test "should stay on same page if create client is invalid" do
    assert_no_difference('Client.count') do
      post clients_url, params: {
        client: @invalidClient
      }
    end

    assert_response 422
  end

  test "should show client" do
    get client_url(@client)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_url(@client)
    assert_response :success
  end

  test "should update client" do
    patch client_url(@client), params: { client: @update }
    assert_redirected_to client_url(@client)
  end

  test "should stay on same page if update client is invalid" do
    assert_no_changes(@client) do
      patch client_url(@client), params: {
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
    assert_difference('Client.count', -1) do
      delete client_url(@client)
    end

    assert_redirected_to clients_url
  end
end
