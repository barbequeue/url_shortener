class RemoveUsers < ActiveRecord::Migration[5.2]
  def change
    remove_belongs_to :links, :user, foreign_key: true
    add_column :links, :token, :string

    remove_index :users, { column: :name, :unique => true }

    drop_table :users do |t|
      t.string :name

      t.timestamps
    end
  end
end
