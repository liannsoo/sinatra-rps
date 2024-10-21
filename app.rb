require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:main)
end

MOVES = ['rock', 'paper', 'scissors']
get '/rock' do
  player_move = 'rock'
  computer_move = MOVES.sample
  result = get_result(player_move, computer_move)
  erb :result, locals: { player_move: player_move, computer_move: computer_move, result: result }
end

get '/paper' do
  player_move = 'paper'
  computer_move = MOVES.sample
  result = get_result(player_move, computer_move)
  erb :result, locals: { player_move: player_move, computer_move: computer_move, result: result }
end

get '/scissors' do
  player_move = 'scissors'
  computer_move = MOVES.sample
  result = get_result(player_move, computer_move)
  erb :result, locals: { player_move: player_move, computer_move: computer_move, result: result }
end

def get_result(player, computer)
  if player == computer
    "We tied!"
  elsif (player == 'rock' && computer == 'scissors') ||
        (player == 'paper' && computer == 'rock') ||
        (player == 'scissors' && computer == 'paper')
    "We won!"
  else
    "We lost!"
  end
end
