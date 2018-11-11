class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :origin
      t.string :shorthand
      t.string :session

      t.timestamps
    end
  end
end
