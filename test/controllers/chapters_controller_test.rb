require 'test_helper'

class ChaptersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chapter = chapters(:one)
  end

  test "should get index" do
    get chapters_url
    assert_response :success
  end

  test "should get new" do
    get new_chapter_url
    assert_response :success
  end

  test "should create chapter" do
    assert_difference('Chapter.count') do
      post chapters_url, params: { chapter: { author: @chapter.author, book_id: @chapter.book_id, content: @chapter.content, description: @chapter.description, title: @chapter.title, user_id: @chapter.user_id } }
    end

    assert_redirected_to chapter_url(Chapter.last)
  end

  test "should show chapter" do
    get chapter_url(@chapter)
    assert_response :success
  end

  test "should get edit" do
    get edit_chapter_url(@chapter)
    assert_response :success
  end

  test "should update chapter" do
    patch chapter_url(@chapter), params: { chapter: { author: @chapter.author, book_id: @chapter.book_id, content: @chapter.content, description: @chapter.description, title: @chapter.title, user_id: @chapter.user_id } }
    assert_redirected_to chapter_url(@chapter)
  end

  test "should destroy chapter" do
    assert_difference('Chapter.count', -1) do
      delete chapter_url(@chapter)
    end

    assert_redirected_to chapters_url
  end
end
