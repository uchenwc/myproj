require 'sinatra'

before do
  content_type :txt
  @defeat = {rock: :scissors, paper:  :rock, scissors: :paper}
  @throws = @defeat.keys
end


get '/throw/:type' do
  play_throw = params[:type].to_sym

  if !@throws.include?(play_throw)
	halt 403, "you must throw one of the following: #{@throws}"
  end

  computer_throw = @throws.sample
  if computer_throw == play_throw
    "Tied, try again!"
  elsif computer_throw == @defeat[play_throw]
    "nice done"
  else
	"Ouch"
  end
end