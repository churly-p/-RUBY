
class AdventureBook
	
    require('./page_display.rb')
	require 'colorize'
	#newlocalbranchcomment
	#can you bulk these, or have to individually define?
	attr_reader :name
	attr_reader :page 
	attr_reader :max_page
	attr_accessor :jumps
	
	def initialize(name, book)  #might eventually pass path of adventure to run multiple adventures from same code
		@name = name
		@page = 1
		@max_page = 999   #this might be better off defined in the file that contains the actual contents
		
		#give us some way of showing where we've been 
		@jumps = 0
		
		#initialize trace of journey with page 1
		@trace_journey = []
		@trace_journey[0] = 1
		@bookstorage = []
		
		book_path = "./"+book
		book_path.chomp
		#puts "#{book_path} PATH"
		#system("dir")
		lc = 0
		File.open(book_path, 'r') do |f1|  
		#File.open('.\\book1.txt', 'r') do |f1|  

			while line = f1.gets  
				#puts line  
				@bookstorage[lc] = line.chomp.to_i;
				lc += 1;
			end 
	    @max_page = @bookstorage[0] #.chomp.to_i
		@bookstorage.shift
		@death = @bookstorage
		#puts "#{@death}"
		
		
end  
		
	end

   
	def the_end
		puts "Well, that was fun!  See you again soon #{@name}!"
		puts "#{@jumps + 1} total pages read using #{@jumps} page jumps."
		puts "Pages: #{@trace_journey}"
	end
   
	def jump_to_page(new_page)
		if( new_page != @max_page && new_page < @max_page)
			puts "We're jumping from page #{@page}! Hold on tight, off to visit page #{new_page}!"

			sleep(2)
			clear_page()
			@page = new_page
			@jumps += 1
			@trace_journey[@jumps] = @page  #add new page to trace of journey
			if(@death.include? @page)
				puts "YOU DIED".colorize(:color => :red, :background => :white)
				exit
				
			else
				puts "Wow! Such adventure! We're on page #{@page}. Where to go to next, #{@name}?"
			end
		else
			puts "The end is near!"
			@jumps += 1
			@page = new_page
			@trace_journey[@jumps] = new_page
			self.the_end
		end
	end
   
