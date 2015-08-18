class CreateVotedIdentificators < ActiveRecord::Migration
  def change
    create_table :voted_identificators do |t|
      t.integer :poll_id
      t.text :user_identificator

      t.timestamps null: false
    end
  end
end
