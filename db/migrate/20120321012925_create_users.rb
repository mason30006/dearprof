class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :teacher, default: false
      t.string :netid

      t.timestamps
    end

    add_index :users, :netid, unique: true
  end
end
