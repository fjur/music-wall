helpers do
  def current_user
    if session[:user_id]
      User.find(session[:user_id]).email
    end
  end

end

# Homepage (Root path)
get '/' do
  erb :index
end

get '/music' do
  @songs = Song.all
  erb :'music/index'
end

get '/music/new' do
  erb :'music/new'
end

get '/music/:id' do
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
  redirect '/music'
end

post '/upvote/:id' do
  @song = Song.find params[:id]
  vote = @song.user.votes.create(value: 1)
  vote.update(song_id: @song.id)
  # vote.song_id = @song.id
  # vote.save
  redirect '/music'
end

post '/signup' do
  user = User.create(email: params[:email], password: params[:password])
  session[:user_id] = user.id
  redirect '/music'
end

post '/logout' do
  session[:user_id] = nil
  redirect '/music'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.password = params[:password]
    session[:user_id] = user.id
    redirect '/music'
  else

  end
end
