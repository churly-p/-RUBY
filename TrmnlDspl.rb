def clearpage
# i think this is working by calling a method that returns boolena true if on win, boolean false otherwise 
# if return true ? run a cls  else : run a clear
# this arrangement should only work if return value is boolean?
	Gem.win_platform? ? (system "cls") : (system "clear")
end