
class HelloWorld
   def initialize(name)
	
	@name = name
        self.sayHi
   end
   
	def titleize(namee)
            namee.split(/\s|\-|\_|\./).map(&:capitalize).join(" ")
	end
   def sayHi
      puts "Hello #{self.titleize(@name)}!"
   end
end

a = ARGV[0]
puts "#{ARGV[0][2].capitalize}"
hello = HelloWorld.new(a)
hello.sayHi