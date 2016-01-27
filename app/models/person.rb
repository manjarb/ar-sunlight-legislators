require_relative '../../db/config'

class Person < ActiveRecord::Base

end

class Rep < Person

end

class Sen < Person

	def find_first
		Sen.first
	end
	
end

class Del < Person
	
end

class Com < Person
	
end