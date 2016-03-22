helpers do
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def get_song_reviewer(review)
    User.find_by_id(review.user_id).email
  end

end

# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'music/index'
end

get '/music/new' do
  erb :'music/new'
end

get '/music' do
  @song = Song.find params[:id]
  erb :'music/show'
end

post '/music' do
    @songs = Song.new(
      song_title: params[:song_title],
      author: params[:author],
      url: params[:url]
    )
    if current_user
      @songs.user_id = session[:user_id]
    end
  @songs.save
  redirect '/songs'
end

post '/upvote/:id' do
  @song = Song.find params[:id]
  vote = @song.votes.create(value: 1) #this is saving the songs user who created it, not the user who upvoted
  vote.update(song_id: @song.id, user_id: current_user.id)
  # vote.song_id = @song.id
  # vote.save
  redirect '/songs'
end

post '/signup' do
  user = User.create(email: params[:email], password: params[:password])
  session[:user_id] = user.id
  redirect '/songs'
end

post '/logout' do
  session[:user_id] = nil
  redirect '/songs'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/songs'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.password = params[:password]
    session[:user_id] = user.id
    redirect '/songs'
  end
end

 # t.integer "user_id"
 #    t.integer "song_id"
 #    t.string  "title"
 #    t.string  "content"
 #    t.integer "rating"

post '/review/:id' do
  @song = Song.find params[:id]
  review = @song.reviews.create( title: params[:title],
                               content: params[:content],
                                rating: params[:rating],
                                user_id: current_user.id
                              )
  redirect '/songs'
  
end

post '/review_delete/:id' do
  @review = Review.find params[:id]
  @review.destroy
  redirect '/songs'
end






