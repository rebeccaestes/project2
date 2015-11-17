class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
    	t.string "name"
    	t.string "directions"
    	t.string "city"
    end
  end
end
