require "application_system_test_case"

class DownloadsTest < ApplicationSystemTestCase
    test "should get index" do
        visit downloads_url
        assert_selector "h1", text: "Download Request"
    end

    test "should get new" do
        sign_in_system_admin
	    visit new_download_url
        assert_selector "h1", text: "New Request"
	end

    test "should not get new if not admin" do
        sign_in_system_normal
	    visit new_download_url
        # goes back to root if not admin
        assert_selector "h1", text: "Talon Agency"
	end

    test "should create new" do
        sign_in_system_admin
	    visit new_download_url
        fill_in "Title", with: "Test Request"
        page.attach_file('File', Rails.root + 'test/fixtures/sample.pdf', make_visible: true)
        click_on "Create Request"
        assert_selector "h1", text: "Download Request"
        #redirect_to downloads_path
        #assert_redirected_to downloads_url
	end

    test "should not create new if not admin" do
        sign_in_system_normal
	    visit new_download_url
        assert_selector "h1", text: "Talon Agency"
        #assert_redirected_to downloads_url
	end

    test "it should create new even when no file is attached" do
        sign_in_system_admin
        visit new_download_url
        fill_in "Title", with: "Hey how are you? Have you completed your task"
        click_on "Create Request"
        assert_text "Download Request"
	 end
end