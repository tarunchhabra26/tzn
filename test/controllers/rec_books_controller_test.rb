require 'test_helper'

class RecBooksControllerTest < ActionController::TestCase
  setup do
    @rec_book = rec_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rec_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rec_book" do
    assert_difference('RecBook.count') do
      post :create, rec_book: { Author: @rec_book.Author, Description: @rec_book.Description, Name: @rec_book.Name }
    end

    assert_redirected_to rec_book_path(assigns(:rec_book))
  end

  test "should show rec_book" do
    get :show, id: @rec_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rec_book
    assert_response :success
  end

  test "should update rec_book" do
    patch :update, id: @rec_book, rec_book: { Author: @rec_book.Author, Description: @rec_book.Description, Name: @rec_book.Name }
    assert_redirected_to rec_book_path(assigns(:rec_book))
  end

  test "should destroy rec_book" do
    assert_difference('RecBook.count', -1) do
      delete :destroy, id: @rec_book
    end

    assert_redirected_to rec_books_path
  end
end
