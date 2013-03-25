class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.text :description
      t.references :subrubric

      t.timestamps
    end
    add_index :companies, :subrubric_id
  end
end
