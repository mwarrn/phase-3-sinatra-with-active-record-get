class ApplicationController < Sinatra::Base

  # Add this line to set the Content-Type header for all responses
  set :default_content_type, 'application/json'

  get '/' do
    { message: "Hello world" }.to_json
  end

  get '/games' do
    # get all the first 10 games from the database
    games = Game.all.order(:title).limit(10)
    # return a JSON response with an array of all the game data
    games.to_json
  end

  # use the :id syntax to create a dynamic route
  get '/games/:id' do
    # look up the game in the database using its ID
    game = Game.find(params[:id])
    # send a JSON-formatted response of the game data
    game.to_json(include: :reviews)
  end

  # Getting all the games from the database and ordering them by title.
  get '/games/order' do
    games = Game.all.order(:title)
    games.to_json
  end

  # Getting the first 10 games in the database and returning them in JSON format.
  get '/games/first10' do
    games = Game.all.order(:title).limit(10)
    games.to_json
  end

end
