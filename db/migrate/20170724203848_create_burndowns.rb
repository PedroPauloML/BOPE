class CreateBurndowns < ActiveRecord::Migration[5.0]
  def change
    create_table :burndowns do |t|
      t.float :points_made, defaul: 0
      t.integer :activities_updates, array: true
      t.references :project, foreign_key: true
      t.references :week, foreign_key: true

      t.timestamps
    end
  end
end
