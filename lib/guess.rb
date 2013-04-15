class Guess

	def self.name_selector
		# namelist = ["Chris", "John", "Jenny", "Sherry", "Andrew", "Christine", "Brandon", "Pearl"]
		namelist = User.all
		samplename = namelist.sample
		
		#put an if stmt here so @@namelist != the real name
	end


end