# Homepage (Root path)
helpers do
  def logged_in
    @user = User.find(session[:id])
  end
end

configure do
  enable :sessions
end

get '/' do
  erb :index
end

get '/signup' do
  erb :'/signup'
end

post '/signup' do
  @user = User.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email:    params[:email],
    password: params[:password]
  )
  redirect '/'
  # if @user.save
  #   redirect 'index'
  # else
  #   erb :'/signup'
  # end
end

get '/signin' do
  erb :'/signin'
end

post '/signin' do
  @user = User.find_by(email: params[:email])

  if @user
    puts @user.inspect
    if @user.password == params[:password]
      session[:id] = @user.id
      redirect '/'
    else
      redirect '/signin'
    end
  end
end

get '/users' do
  @users = User.all
  erb :'users/index'
end

# get '/users/:id' do
#   @user = User.find params[:id]
#   erb :'users/show'
# end

get '/reviews' do
  @reviews = Review.all
  erb :'reviews/index'
end

post '/reviews' do
  @review = Review.create(
    title: params[:title],
    review: params[:review],
    user_id: session[:id],
    song_id: params[:song_id]
  )

  if @review.save
    redirect '/songs'
  else
    @error=review.error.full_messages
    @song = Song.find params[:song_id]
    erb :'songs/show'

  end

end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  erb :'songs/new'
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end

post '/songs' do
  @song = Song.new(
    song_title: params[:song_title],
    artist:     params[:artist],
    album:      params[:album],
    user_id:    session[:id]
    )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

post '/vote' do
  @vote = Vote.create(
    user_id: session[:id],
    song_id: params[:song_id]
    )
  redirect '/songs'
end
