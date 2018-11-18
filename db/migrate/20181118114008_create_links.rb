class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :origin
      t.string :shorthand
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
