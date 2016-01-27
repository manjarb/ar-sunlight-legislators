require_relative '../../db/config'

class Senator < ActiveRecord::Base
  # belongs_to :party
  # belongs_to :state
  def all
  	Senator.all
  end

  def state(state)
  	senators = Senator.where(state: state).order('name')
  	#senators_arr = {}

  	puts 'Senators'
  	senators.each { |x|
  		puts x.attributes['name'] + " (#{x.attributes['party']})"
  	}
  end
  def gender(gender)
  	gender_u = gender.upcase
  	senators_all = Senator.all
  	senators = Senator.where(gender: gender_u)

  	percentage = (senators.length.to_f / senators_all.length.to_f) * 100

  	if gender_u == "M"
  		puts "Male Senators: #{senators.length} (#{percentage.round(2)})%"
  	else
  		puts "Female Senators: #{senators.length} (#{percentage.round(2)})%"
  	end
  end

  def return_state_list
  	temp_hash = {}
  	senators_all = Senator.all
  	senators_all.each { |x| 
  		if temp_hash.has_key?(x.attributes['state'])
  			#temp_hash[x.attributes['state']] = []
  		else
  			temp_hash[x.attributes['state']] = []
  		end
  	}

  	# puts temp_hash
  	# puts ""
  	temp_hash = temp_hash.sort.to_h

  	senators_all.each { |x| 
  		temp_hash[x.attributes['state']] << x.attributes['name']
  	}

   	return temp_hash
  end
end