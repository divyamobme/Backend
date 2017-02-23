require './moviereview'
require 'test/unit'
require 'rack/test'

set :environment, :test

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

    def test_register_user
      post "/userinfo", name: 'amrutha' , email: 'amrutha@gmail.com', password: 'amrutha1'
      # assert last_response.ok?
      assert_equal '{"name" => "amrutha" ,"email" =>"amrutha@gmail.com", "password"=>"amrutha1"}', last_response.body
      # last_response.body.must_match 'ammu has been saved'
    end
    def test_email_wrong
      post "/userinfo", name: 'amrutha' , email: 'amruthagmail.com', password: 'amrutha1'
     assert_equal '{"result" => "invalid email"}'.to_json, last_response.body
    end
  # def test_create
  #   register = Register.create(:name => "Rob")
  #   assert_equal "Rob", register.name
  # end

  # def test_find
  #   register = Register.find_by_name("Rob")
  #   assert_equal "rob@gmail.com", register.email
  # end

  #   def test_
  #   end


    def test_user_login_or_not
      post "/login","email" =>"chinnu@gmail.com", "password_digest"=>"chinnu3"
      authorize "chinnu3", "secret"
       # assert last_response.ok?
      assert_equal '{"email" =>"chinnu@gmail.com", "password_digest"=>"chinnu3"}', last_response.body
    end

    def test_user_details
      get '/index'
      assert last_response.ok?
    end

    # def test_delete
    #   delete '/post', "id" => 3
    #   assert last_response.ok?
    # end
    
    # def test_movie_details_added
    # post '/adminhome', "moviename" => "Kodi" , "language" => "Tamil", "rating" => 3.0 , 
    # "description" => "Running successfully", "producer" => "hdfjfkggk", "director" => "ffjshshsj",
    #  "maincast" => "dgfg,yyuuu", "image" =>"img004frr"
    # end

    def test_moviename_there
      post '/home/search',"moviename" =>"My Boss"
      assert last_response.ok?
    end

    def test_language
      post '/home/language',"language" =>"Malayalam"
      assert last_response.ok?
    end

    def test_edit_movielist
      get '/edit/movielist'
      assert last_response.ok?
    end

    def test_edit_moviedetails
      post '/edit/moviedetails',"moviename" =>"Kodi"
       assert last_response.ok?
    end

    # def test_moviedetails_comments
    #   post '/moviedetails/comments',"username"=>"dhanya@gmail.com","moviename"=>"Singham 3",
    #   "comments"=>"Action movie of surya","rating"=> 4.0
    #   assert last_response.ok?
    # end
    
    def test_view_comments
    post '/view/comments',"moviename"=>"Singham 3"
    assert last_response.ok?
    end

    # def test_delete_view_comments
    #   delete '/review/id',"id"=>6
    #    assert last_response.ok?
    # end

    def test_movie_details_updates
      post '/moviedetail/update', "id" =>1
      assert last_response.ok?
    end

    def test_home_movielist
      post '/home/movielist' 
      assert last_response.ok?
    end
    
    def test_movielist_language
      post '/home/movielist/language',"language"=>"Tamil"
      assert last_response.ok?
    end

    # def test_forum_comments
    #   post '/forum/comments',"username"=>"divya","language"=>"Tamil","comments"=>"Bogan Fantastic movie",
    #   "created_at"=>"22-02-2017"
    #    assert last_response.ok?
    # end

    def test_view_forum_comments
      post '/view/forum/comments',"language"=>"malayalam"
      assert last_response.ok?
    end

    # def test_delete_forum_comments
    #   delete '/forum/id',"id"=>9
    #   assert last_response.ok?
    #   # assert_includes last_response.body, "Forum id number 8"
    # end


  # def test_return_the_parameters
  #       data = {
  #           'reqID' => 1,
  #           'signedReqID' => "plop",
  #           'cert' => "mycert"
  #       }
  #       post '/', data.to_json, "CONTENT_TYPE" => "application/json"
  #       assert last_response.ok?
  #       body_espected = "Hello !\n#{JSON.parse(data.to_json).to_s}"
  #       assert_equal last_response.body, body_espected
  #   end
end
#     # assert_respond_to matcher
    #     # last_response.must_be :ok?
    #     # assert browser.last_response.ok?
    #     # assert_equal 'Hello Bryan', browser.last_response.body
    #      # assert last_response.body.include?('Bryan')
    #      # assert_match


# def test_check_methods
  # data = '{"dataIn": "hello"}'
  # post '/echo', JSON.parse(data)
  # assert.last_response.ok?
  # assert(last_response.body == data)
  # end

# class HelloWorldTest < Test::Unit::TestCase
#   include Rack::Test::Methods

#   def app
#     Sinatra::Application
#   end

#   def test_it_says_hello_world
#     get '/'
#     assert last_response.ok?
#     assert_equal 'Hello World', last_response.body
#   end

#   def test_it_says_hello_to_a_person
#     get '/', :name => 'Simon'
#     assert last_response.body.include?('Simon')
#   end
# end

