class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :title,null: false
      t.text :body,null: false
      t.references :user, null: false, foreign_key: true,index: true
      t.references :forum, null: false, foreign_key: true,index: true

      t.timestamps
    end
  end
end
