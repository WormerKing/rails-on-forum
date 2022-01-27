class CreateForums < ActiveRecord::Migration[6.1]
  def change
    create_table :forums do |t|
      t.string :name,null: false
    end
    add_index :forums,:name,unique: true
  end
end
