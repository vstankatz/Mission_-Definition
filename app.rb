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

get('/Home_Page/new_word') do
  erb(:new_word)
end
