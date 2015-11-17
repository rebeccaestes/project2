class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
	  # t.string "venue"
	  # t.string "venue_url"
	  # t.string "city"
	  t.date "date"
	  t.string "headliner"
	  t.string "headliner_pic"
	  t.string "headliner_url"
	  t.text "openers_etc"
	  t.string "buy"
	  t.integer "price"
	  t.references "venue"
      t.timestamps null: false
    end
  end
end
