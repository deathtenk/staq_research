require 'rubygems'
require 'mechanize'
require 'pry'

def show_pages
  @page.links.each do |link|
    puts link.text
  end
end

while true
  agent = Mechanize.new
  @page = agent.get('http://google.com/')
  google_form = @page.form('f')
  puts 'search term: ' 
  google_form.q = gets
  @page = agent.submit(google_form, google_form.buttons.first)
  @page = @page.search(".//h3[@class='r']")
  
  puts "\n...results..."
  @page[0..4].each do |link|
    puts link.text
  end

end