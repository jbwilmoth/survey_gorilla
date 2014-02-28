class CreateSurveys < ActiveRecord::Migration
def change
    create_table :surveys do |column|
      column.integer :creator
      column.string :name

      column.timestamps
    end
  end
end
