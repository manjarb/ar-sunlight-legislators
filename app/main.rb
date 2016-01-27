require 'pathname'

APP_ROOT = Pathname.new(File.dirname(File.expand_path(__FILE__)))

require APP_ROOT.join('models', 'representative')
require APP_ROOT.join('models', 'senator')

senators = Senator.new
representatives = Representative.new

senators.state('NY').inspect
representatives.state('NY').inspect
senators.gender('f')
representatives.gender('f')

#state_list =
senators_list = senators.return_state_list
representatives_list = representatives.return_state_list
i = 0
senators_list.each { |value|
	puts "#{value[0]}: #{value[1].length} Senators, #{representatives_list[value[0]].length} Representative(s)"
	i += 1
}

puts "Senetors: #{senators.all}"
puts "Representatives: #{representatives.all}"

puts "Senetors active: #{senators.active_all}"
puts "Representatives active: #{representatives.active_all}"