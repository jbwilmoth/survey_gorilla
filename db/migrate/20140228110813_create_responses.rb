class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :taker_id
      t.belongs_to :choice

      t.timestamps
    end
  end
end
