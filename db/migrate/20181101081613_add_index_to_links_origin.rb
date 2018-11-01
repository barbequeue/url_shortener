class AddIndexToLinksOrigin < ActiveRecord::Migration[5.2]
  def change
    add_index :links, :origin, unique: true
  end
end
