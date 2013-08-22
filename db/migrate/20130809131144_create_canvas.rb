class CreateCanvas < ActiveRecord::Migration
  def change
    create_table :canvas do |t|
      t.string :title
      t.integer :user_id
      t.string :hashtag

      t.timestamps
    end
  end
end
