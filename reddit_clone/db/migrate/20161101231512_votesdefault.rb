class Votesdefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:links, :votes, 1)
  end
end
