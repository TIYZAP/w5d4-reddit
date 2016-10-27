class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :title
      t.integer :votes
      t.string :url
      t.text :summary

      t.timestamps
    end
  end
end
