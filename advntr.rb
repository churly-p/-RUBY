#this is what will run an adventure
require('./adventure_book.rb')
require('./page_display.rb')

clear_page()
puts "What's your name, cowboy?"
adventurer =  (gets).chomp  #if we encapsulate the gets in (parens) we can treat it as a string and use string methods directly on input
#we don't really care about checking input here
#this is not sanitary at all in the real world

book = "book1.txt"
clear_page()
#lets get started, instantiate the adventure
a = AdventureBook.new(adventurer, book)
#set nextpage to inital page, always start on page 1
next_page = 1

puts "Hey, #{a.name}! We begin on page: #{a.page}. Where to go next?"

#while not end of book (page 999 or whatever we want)
while next_page != a.max_page
	nps = ((gets).chomp)
	next_page = nps.to_i   #if string is a number, will be pos - if not a number or 0 it will be 0
	while next_page == 0  || next_page > a.max_page #input was not a number (or larger than maxpage) try for a better input
		puts "EXCEPTION ERROR: #{nps} >> page: #{next_page} : NOT A VALID PAGE NUMBER!"
		nps = ((gets).chomp).to_i
		next_page = nps.to_i  #same as above, doesn't seem elegant, but works
	end
	#we have a number to work with
	a.jump_to_page(next_page)

end


