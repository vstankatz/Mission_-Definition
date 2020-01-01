require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/define')
require('pry')
enable :sessions
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:home)
end

get('/home_page') do
  @words = Word.all
  erb(:home)
end


get('/home_page/new_word') do
  erb(:new_word)
end

post('/home_page') do
  word = params[:word]
  words = Word.all
  new_word = Word.new({:name => word, :id => nil})
  new_word.save
  words.each do |w|
    if new_word == w
      new_word.delete
      redirect to('/home_page')
    elsif new_word.name == ""
      new_word.delete
      redirect to('/home_page')
    else
      next
    end
  end
  @words = Word.all
  erb(:home)
end

get('/home_page/:word_id') do
  @word = Word.find(params[:word_id].to_i)
  @definitions = Define.all
  erb(:view_word)
end

get('/home_page/:word_id/edit') do
  @word = Word.find(params[:word_id].to_i)
  erb(:edit_word)
end

patch('/home_page/:word_id') do
  @word = Word.find(params[:word_id].to_i)
  new = params[:word]
  @word.update(new)
  @words = Word.all
  @definitions = Define.all
  erb(:view_word)
end

get('/home_page/:word_id/define') do
  @word = Word.find(params[:word_id].to_i)

  erb(:new_def)
end
