class CreateSurvey < ActiveRecord::Migration
  def change
    create_table :survey do |column|
      column.integer :creator 
      column.string :name

      column.timestamps 
    end
  end
end
