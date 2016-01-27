require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateAllTables < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :senators do |t|
    	t.string :name
        t.string :phone
        t.string :fax
        t.string :website
        t.string :email
        t.string :gender
    	t.date :birthday
        t.string :twitter_id
        t.string :active
        t.string :party
        t.string :state
        # t.belongs_to :party, index: true
        # t.belongs_to :state, index: true
    end

    create_table :representatives do |t|
        t.string :name
        t.string :phone
        t.string :fax
        t.string :website
        t.string :email
        t.string :gender
        t.date :birthday
        t.string :twitter_id
        t.string :active
        t.string :party
        t.string :state
        # t.belongs_to :party, index: true
        # t.belongs_to :state, index: true
    end

    # create_table :parties do |t|
    #   t.string :name
    # end
    # create_table :states do |t|
    #   t.string :name
    # end
  end
end
