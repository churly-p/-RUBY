#HANDLES PAGE DISPLAY ISSUES - FOR NOW, TERMINAL ONLY - 5/9/2016
def clear_page
# i think this is working by calling a method that returns boolean true if on win, boolean false otherwise 
# if return true ? run a cls  else : run a clear
# this arrangement should only work if return value is boolean?
	Gem.win_platform? ? (system "cls") : (system "clear")
end

#need to put some stuff to change the color for you are dead, end of book, etc
#gem install on windows failing so hold off for now

