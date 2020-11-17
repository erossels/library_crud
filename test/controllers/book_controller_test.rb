class BooksControllerTest < ActionController::TestCase
    test 'get index' do
        get :index
        assert_response :success
        assert_template :index 
    end

    test 'book create' do
        params = {
        title: "Another Title",
        author: "Name of the author",
        genre: 'Fantasy',
        status: 'estante'
        }

        book = Book.new(params)

        assert_response :success
        assert book.save
    end
end