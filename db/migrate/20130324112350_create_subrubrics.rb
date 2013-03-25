class CreateSubrubrics < ActiveRecord::Migration
  def change
    create_table :subrubrics do |t|
      t.string :name
      t.references :rubric

      t.timestamps
    end
    add_index :subrubrics, :rubric_id
  end
end
