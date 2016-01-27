require 'csv'
require_relative '../app/models/representative'
require_relative '../app/models/senator'

class SunlightLegislatorsImporter
  def self.import(filename)
    i = 0
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      person_hash = {
                      :name => "#{row['firstname']} #{row['middlename']} #{row['lastname']}",
                      :phone => row['phone'],
                      :fax => row['fax'],
                      :website => row['website'],
                      :email => row['webform'],
                      :gender => row['gender'],
                      :birthday => row['birthdate'],
                      :twitter_id => row['twitter_id'],
                      :active => row['in_office'],
                      :party => row['party'],
                      :state => row['state']
                    }
      print person_hash
      puts ""

      if row['title'].to_s.downcase == "rep"
        Representative.create!(person_hash)
        #puts "made rep"
      elsif row['title'].to_s.downcase == "sen"
        Senator.create!(person_hash)
        #puts "made sen"
      end
      
      # row.each do |field, value|
      #   # TODO: begin
      #   print field
      #   puts ""
      #   print value
      #   puts ""

      #   person_hash = {:name => }

      #   #raise NotImplementedError, "TODO: figure out what to do with this row and do it!"

      #   # TODO: end
      # end
    end
  end
end

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end

filename = '../db/data/legislators.csv'
SunlightLegislatorsImporter.import(filename)