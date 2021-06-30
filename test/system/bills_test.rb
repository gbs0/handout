require "application_system_test_case"

class BillsTest < ApplicationSystemTestCase
  setup do
    @bill = bills(:one)
  end

  test "visiting the index" do
    visit bills_url
    assert_selector "h1", text: "Bills"
  end

  test "creating a Bill" do
    visit bills_url
    click_on "New Bill"

    fill_in "Attachment docs", with: @bill.attachment_docs
    fill_in "Author", with: @bill.author
    fill_in "Expiration date", with: @bill.expiration_date
    fill_in "Last process", with: @bill.last_process
    fill_in "Last process date", with: @bill.last_process_date
    fill_in "Link", with: @bill.link
    fill_in "Localization", with: @bill.localization
    fill_in "Status", with: @bill.status
    fill_in "Summary", with: @bill.summary
    fill_in "Timestamp", with: @bill.timestamp
    fill_in "Title", with: @bill.title
    click_on "Create Bill"

    assert_text "Bill was successfully created"
    click_on "Back"
  end

  test "updating a Bill" do
    visit bills_url
    click_on "Edit", match: :first

    fill_in "Attachment docs", with: @bill.attachment_docs
    fill_in "Author", with: @bill.author
    fill_in "Expiration date", with: @bill.expiration_date
    fill_in "Last process", with: @bill.last_process
    fill_in "Last process date", with: @bill.last_process_date
    fill_in "Link", with: @bill.link
    fill_in "Localization", with: @bill.localization
    fill_in "Status", with: @bill.status
    fill_in "Summary", with: @bill.summary
    fill_in "Timestamp", with: @bill.timestamp
    fill_in "Title", with: @bill.title
    click_on "Update Bill"

    assert_text "Bill was successfully updated"
    click_on "Back"
  end

  test "destroying a Bill" do
    visit bills_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bill was successfully destroyed"
  end
end
