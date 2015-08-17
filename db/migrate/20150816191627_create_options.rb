class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.text :title
      t.integer :votes, default: 0
      t.integer :poll_id

      t.timestamps null: false
    end
  end
end
