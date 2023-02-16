class CreateClassifieds < ActiveRecord::Migration[7.0]
  def change
    create_table :classifieds do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :contact
      t.string :location
      t.string :occupation
      t.string :description
      t.integer :user_id
      t.boolean :is_verified

      t.timestamps
    end
  end
end
