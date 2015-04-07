class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :original
      t.string :shortened
      t.integer :click_count, default: 0

      t.timestamps null: false
    end
  end
end
