require 'test_helper'

class BillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bill = bills(:one)
  end

  test "should get index" do
    get bills_url
    assert_response :success
  end

  test "should get new" do
    get new_bill_url
    assert_response :success
  end

  test "should create bill" do
    assert_difference('Bill.count') do
      post bills_url, params: { bill: { attachment_docs: @bill.attachment_docs, author: @bill.author, expiration_date: @bill.expiration_date, last_process: @bill.last_process, last_process_date: @bill.last_process_date, link: @bill.link, localization: @bill.localization, status: @bill.status, summary: @bill.summary, timestamp: @bill.timestamp, title: @bill.title } }
    end

    assert_redirected_to bill_url(Bill.last)
  end

  test "should show bill" do
    get bill_url(@bill)
    assert_response :success
  end

  test "should get edit" do
    get edit_bill_url(@bill)
    assert_response :success
  end

  test "should update bill" do
    patch bill_url(@bill), params: { bill: { attachment_docs: @bill.attachment_docs, author: @bill.author, expiration_date: @bill.expiration_date, last_process: @bill.last_process, last_process_date: @bill.last_process_date, link: @bill.link, localization: @bill.localization, status: @bill.status, summary: @bill.summary, timestamp: @bill.timestamp, title: @bill.title } }
    assert_redirected_to bill_url(@bill)
  end

  test "should destroy bill" do
    assert_difference('Bill.count', -1) do
      delete bill_url(@bill)
    end

    assert_redirected_to bills_url
  end
end
