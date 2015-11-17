class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references "user"
      # index: true, foreign_key: true
      t.references "concert"
    end
  end
end
