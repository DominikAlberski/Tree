class OrangeTree
	attr_reader :name
	def initialize (name)
		@name = name
		@tall = 0
		@age = 0
		@fruit = 0
		@fruit_picked = 0
		@water = 10
		@action = 0
		puts "Tree #{@name} planted!"
		until @age == 31 do
			puts "What would you like to do with your #{@name}?"
			puts "(W)ater, (S)oil, (C)ount, (P)ick, (T)ime, (H)eight, (N)othing, e(X)it"
		@choice = gets.chomp.capitalize
		methodChoice(@choice)
		end
	end

	def timePasses(age=1)
		
		puts "Year passes" if age > 0
		
		@age += age
		@fruit = 0
		@action = 0

		if @water <= 0
			puts "Your #{@name} dries out and dies"
			exit
		elsif @water <= 5
			puts "Your #{@name} looks sed and dry"
		elsif @water > 20
			puts "Your #{@name} got to much water and starts to root"
		elsif @water > 25
			puts "Your tree rooted from to much water"
			exit
		end
		
		case @age
		when 0 
			@tall = 0
		when 1
			@tall = 0.5
			@fruit = rand(2)
		when (2..3)
			@tall = 1.5
			@fruit = rand(4)
		when (4..5)
			@tall = 2
			@fruit = rand(2..5)
		when (6..10)
			@tall = 2.5
			@fruit = rand(2..7)
		when (11..14)
			@tall = 3
			@fruit = rand(2..10)
			puts "Your tree is fully grown"
		when (15..29)
			@fruit = rand(3..15)									
		else
			puts "Your tree get old and die from old age"
			exit
		end
	end

	def waterTree
		@action +=1
		puts "You pour water on to #{@name}"
		@water += 2
		actionCounter
	end

	def checkWater
		@action += 1
		if @water > 5
			puts "The soil is wet Your #{@name} has water"
		else
			puts "Your soil is dry You need to water Your Tree"
		end
		actionCounter
	end
	
	def height
		@action += 1
		if @tall == 0 
			puts "Your #{@name} is just planted"
		else
			puts "You are mesuring your tree"
			puts "Your #{@name} is #{@tall} m heigh"
		end
		actionCounter
	end
	
	def countTime
		puts "Your #{@name} is #{@age} old"
	end

	def countTheOreanges 
		puts @fruit == 1 ? "This year You have #{@fruit} fruit" : "This year You have #{@fruit} fruits"
	end

	def pickAnOrange(x)
		@action += 1
		if @fruit == 0
			puts "there is no fruits"
		elsif @fruit < x
			puts "there is not enough fruits"
		elsif x == 1
			@fruit -= x
			@fruit_picked += x
			puts "Mmmm delicious fruit"						
		else
			@fruit -= x
			@fruit_picked += x
			puts "Mmmm delicious fruits"
		end
		actionCounter
	end
	
	private
	
	def timePasses2
		puts "How many years would you like to pass?"
		y = gets.to_i
		if y == nil
			timePasses(y)
		else
			@water -= y**2
			timePasses(y)
		end	
	end

	def actionCounter
		case @action
		 when (0..4) 
		 	puts "time pases"
		 when (5..10)
		 	timePasses
		 end 
	end
	
	def methodChoice(choice)
		case choice
		when "W"
			waterTree
		when "S"
			checkWater
		when "C"
			countTheOreanges
		when "P"
			puts "How many fruits would you like to pick"
			x = gets.to_i
			pickAnOrange(x)	
		when "T"
			countTime
		when "H"
			height
		when "X"
			puts "Are You shure Y/N ?"
			answer = gets.chomp.capitalize
			if answer == "Y"
				exit
			end
		else
			timePasses2
		end
	end


end

puts "Your tree name:"
name = gets.chomp

tree = OrangeTree.new(name)