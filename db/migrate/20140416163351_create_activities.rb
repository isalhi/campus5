class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :id_activity
      t.string :id_creator
      t.string :id_location
      t.string :name
      t.string :date
      t.string :duration
      t.string :cathegory
      t.string :description
      t.boolean :privacy

      t.timestamps
    end
  end
  def self.down
    drop_table :activities
  end
end
