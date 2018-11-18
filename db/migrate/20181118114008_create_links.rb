class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :origin
      t.string :shorthand
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
    add_index :links, :shorthand, unique: true
  end
end
