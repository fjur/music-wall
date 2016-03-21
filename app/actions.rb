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
  @songs.save
  redirect '/music'
end

