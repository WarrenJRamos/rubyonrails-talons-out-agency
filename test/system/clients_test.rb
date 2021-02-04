require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "creating a Client" do
    visit clients_url
    click_on "New Client"

    fill_in "Address", with: @client.address
    fill_in "City", with: @client.city
    fill_in "Client", with: @client.client_id
    fill_in "Client name", with: @client.client_name
    fill_in "Company", with: @client.company
    fill_in "Email", with: @client.email
    fill_in "Fax", with: @client.fax
    fill_in "Notes", with: @client.notes
    fill_in "Phone", with: @client.phone
    fill_in "State", with: @client.state
    check "Status" if @client.status
    fill_in "Total requests", with: @client.total_requests
    fill_in "Zip", with: @client.zip
    click_on "Create Client"

    assert_text "Client was successfully created"
    click_on "Back"
  end

  test "updating a Client" do
    visit clients_url
    click_on "Edit", match: :first

    fill_in "Address", with: @client.address
    fill_in "City", with: @client.city
    fill_in "Client", with: @client.client_id
    fill_in "Client name", with: @client.client_name
    fill_in "Company", with: @client.company
    fill_in "Email", with: @client.email
    fill_in "Fax", with: @client.fax
    fill_in "Notes", with: @client.notes
    fill_in "Phone", with: @client.phone
    fill_in "State", with: @client.state
    check "Status" if @client.status
    fill_in "Total requests", with: @client.total_requests
    fill_in "Zip", with: @client.zip
    click_on "Update Client"

    assert_text "Client was successfully updated"
    click_on "Back"
  end

  test "destroying a Client" do
    visit clients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Client was successfully destroyed"
  end
end
