require_relative '../../db/config'

class Representative < ActiveRecord::Base
  # belongs_to :party
  # belongs_to :state
  def all
  	Representative.all.length
  end

  def active_all
  	Representative.where(active: 1).length
  end
  
  def state(state)
  	representatives = Representative.where(state: state).order('name')
  	#senators_arr = {}

  	puts 'Representatives'
  	representatives.each { |x|
  		puts x.attributes['name'] + " (#{x.attributes['party']})"
  	}
  end

  def gender(gender)
  	gender_u = gender.upcase
  	senators_all = Representative.all
  	senators = Representative.where(gender: gender_u)

  	percentage = (senators.length.to_f / senators_all.length.to_f) * 100

  	if gender_u == "M"
  		puts "Male Representatives: #{senators.length} (#{percentage.round(2)})%"
  	else
  		puts "Female Representatives: #{senators.length} (#{percentage.round(2)})%"
  	end
  end

  def return_state_list
  	temp_hash = {}
  	senators_all = Representative.all
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