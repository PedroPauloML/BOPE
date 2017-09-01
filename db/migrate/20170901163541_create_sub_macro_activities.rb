class CreateSubMacroActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_macro_activities do |t|
      t.string :description
      t.float :completeness
      t.references :macro_activity, foreign_key: true

      t.timestamps
    end
  end
end
