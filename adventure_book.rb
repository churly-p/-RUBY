class AdventureBook
	attr_reader: @name, @page, @ max_page
    require('./page_display.rb')
	def initialize(name)  #might eventually pass path of adventure to run multiple adventures from same code
		@name = name
		@page = 1
		@max_page = 999   #this might be better off defined in the file that contains the actual contents
	end

   
	def the_end
		puts "Well, that was fun!  See you again soon #{@name}!"
	end
   
	def jump_to_page(new_page)
		if( new_page != @max_page && new_page < @max_page)
			puts "We're jumping from page #{@page}! Hold on tight, off to visit page #{new_page}!"
			sleep(2)
			clear_page()
			@page = new_page
			puts "Wow! Such adventure! We're on page #{@page}. Where to go to next, #{@name}?"
		else
			puts "The end is near!"
			self.the_end
		end
	end
   
end