require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('#app') do
  before :each do
    Word.clear
    Define.clear
  end

  describe('create word path', {:type => :feature}) do
    it('adds a word and goes to the home page') do
    visit('/home_page')
    click_on('Add a New Word!')
    fill_in('word', :with => 'Happy')
    click_on('Add Word')
    expect(page).to have_content('Happy')
  end
end

describe('create definition path', {:type => :feature}) do
  it('adds a definition and goes to the words page') do
    word = Word.new({:name => 'Happy', :id => nil})
    word.save

  visit("/home_page/#{word.id}/define")
  fill_in('def', :with => 'positive feeling of emotion')
  click_on('Add Definition')
  expect(page).to have_content('Positive feeling of emotion')
end
end

describe('create word edit path', {:type => :feature}) do
  it('edits a word and goes to the home page') do
    word = Word.new({:name => 'Happi', :id => nil})
    word.save
  visit("/home_page/#{word.id}/edit")
  fill_in('word', :with => 'Happy')
  click_on('Edit Word')
  expect(page).to have_content('Happy')
end
end

describe('create definition edit path', {:type => :feature}) do
  it('edits a definition and goes to the word page') do
    word = Word.new({:name => 'Happy', :id => nil})
    word.save
    def1 = Define.new({:type => 'Noun', :name => 'A feeling of emotion', :id => nil, :word_id => word.id})
    def1.save
  visit("/home_page/#{word.id}/define/#{def1.id}/edit")
  fill_in('def', :with => 'Positive feeling of emotion')
  click_on('Add Definition')
  expect(page).to have_content('Positive feeling of emotion')
end
end

describe('create word delete path', {:type => :feature}) do
  it('deletes word and goes to the home page') do
    word = Word.new({:name => 'Happy', :id => nil})
    word.save
  visit("/home_page/#{word.id}/edit")
  click_on('Yes, Delete')
  expect(page).to have_content('There are currently no words to display.')
end
end

describe('create definition delete path', {:type => :feature}) do
  it('deletes definition and goes to the word page') do
    word = Word.new({:name => 'Happy', :id => nil})
    word.save
    def1 = Define.new({:type => 'Noun', :name => 'A feeling of emotion', :id => nil, :word_id => word.id})
    def1.save
  visit("/home_page/#{word.id}/define/#{def1.id}/edit")
  click_on('Yes, Delete')
  expect(page).to have_content('There are currently no definitions to display.')
end
end

end
