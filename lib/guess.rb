class Guess

	def self.name_selector
		# namelist = ["Chris", "John", "Jenny", "Sherry", "Andrew", "Christine", "Brandon", "Pearl"]
		namelist = User.all
		samplename = namelist.sample		
	end


end