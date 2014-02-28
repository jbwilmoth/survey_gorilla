class CreateSurveys < ActiveRecord::Migration
def change
    create_table :surveys do |column|
      column.integer :creator_id
      column.string :name

      column.timestamps
    end
  end
end
