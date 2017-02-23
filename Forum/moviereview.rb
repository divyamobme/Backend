require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'json'
require 'bcrypt'
# require 'action_mailer'
# require 'smtp-tls'
# require 'byebug'
# enable :sessions
#system("ruby email.rb")

set :bind, '0.0.0.0'

set :database, "sqlite3:forumdb.sqlite3"


post '/login' do
  # byebug
  puts params.inspect
  if (params[:email].downcase == "admin" && params[:password] =="admin123")
     response={:result=>"admin"}
  else
  @register = Register.find_by(:email=> params[:email])
  if @register
    if (params[:email].downcase == @register.email)
      if (@register.authenticate(params[:password]))
            session[:id] = @register.id
        #if params[:password] == @register.password
     response = {:result=> "success"}
        else
       response =  {:result => "passworderror" }
        end
    else
      response = {:result=>"usererror"}
    end
  else
    response = {:result => "unknownperson"}
 end
end
   return response.to_json
end

get '/forgot' do
  @register=Register.select(:email)
  content_type :json
  @register.to_json
end

get '/index' do
  
  @register=Register.select(:id,:name,:email,:password_digest).order(id: :desc)
  content_type :json
  #Register( :id , :desc)
  @register.to_json
end

post '/userinfo' do
  @register=Register.new
  @register.name=params[:name] 
  if (Register.find_by(:email=>params[:email]))
    response = {:result=> "email already exists"}
  
  elsif(params[:email]=~/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
    response = {:result=> "success"}
    @register.email=params[:email]
    
    if (Register.find_by(:password_digest=>params[:password]))
    response={:result=>"password already exists"}
  else
   if (params[:password].length >= 6)
    @register.password=params[:password]
    response= {:result=>"success"}
    @register.save
    system("ruby email.rb -p 587")
  else
    response= {:result=>"invalid"}
  end
 end
  else
   response = {:result=> "invalid email"}
  end

    return response.to_json
end

delete '/post' do
  @register = Register.find_by(:id =>params[:id])
  @register.destroy
end

post '/adminhome' do
      puts params.inspect
    @movie=Movie.new
    @movie.moviename=params[:moviename]
    @movie.language=params[:language]
    @movie.rating=params[:rating]
    @movie.description=params[:description]
    @movie.producer=params[:producer]
    @movie.director=params[:director]
    @movie.maincast=params[:maincast]
    @movie.image=params[:image]   
    @movie.save
  
end

post '/home/search' do 
  @movie = Movie.find_by(:moviename=> params[:moviename])
  return @movie.to_json
end

post '/home/language' do
  @movie=Movie.find_by(:language =>params[:language])
   #@movie( id: , :desc)
   return @movie.to_json
end
get '/edit/movielist' do
  @movie=Movie.select("id,moviename").order(id: :desc)
  content_type :json
  @movie.to_json
end

post '/edit/moviedetails' do
 puts params.inspect
    @movie=Movie.find_by(:moviename=> params[:moviename] )
content_type :json
@movie.to_json
end

post '/moviedetails/comments' do
  puts params.inspect
  @review=Review.new
  @review.username=params[:username]
  @review.moviename=params[:moviename]
  @review.comments=params[:comments]
  @review.rating=params[:rating]
  @review.save
end

post '/view/comments' do
 @review=Review.where(:moviename=>params[:moviename]).order(id: :desc)
  @review.to_json
end

delete '/review/id' do
  @review= Review.find(params[:id])
  @review.destroy
end

post '/moviedetail/update' do
  puts params.inspect
  if (@movie = Movie.find_by(:id=> params[:movieid]))
    @movie.moviename= params[:moviename]
    @movie.language= params[:language]
    @movie.rating=params[:rating]
    @movie.description=params[:description]
    @movie.image=params[:image]
    @movie.director=params[:director]
    @movie.producer=params[:producer]
    @movie.maincast=params[:maincast] 
    @movie.save
    content_type :json
    @movie.to_json
  else
    puts "not found"
  end
end

# post '/moviedetail/update' do
#   @movie = Movie.find_by(:moviename=> params[:moviename])
#    puts params.inspect
#   @movie.update(moviename: params[:moviename], language: params[:language],rating: params[:rating],description:params[:description],image: params[:image],director: params[:director],producer: params[:producer],maincast: params[:maincast] )
#   @movie.save
# content_type :json
# @movie.to_json
# end

post '/home/movielist' do
  @movie=Movie.select("moviename,rating,image").order(id: :desc)
  content_type :json
  return @movie.to_json
end

post '/home/movielist/language' do
  @movie=Movie.select("moviename,rating,image").where(:language=>params[:language])
  # @list=@movie.all
  content_type :json
  @movie.to_json
end

post '/forum/comments' do
  puts params.inspect
  @forum=Forum.new
  @forum.username=params[:username]
  @forum.language=params[:language]
  @forum.comments=params[:comments]
  @forum.created_at=params[:created_at]
  @forum.save
end

post '/view/forum/comments' do
 # byebug
 @forum=Forum.where(:language=>params[:language]).order(id: :desc)
 content_type :json
 @forum.to_json
end

delete '/forum/id' do
  @forum = Forum.find(params[:id])
  @forum.destroy
end



=begin

post '/fourm' description do
  @fourm=Fourm.new
  @fourm.email=params[:email]
  @fourm.comments=param[:comments]
  @fourm.save
end
=end

