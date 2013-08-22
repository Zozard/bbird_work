class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text
      t.integer :id_twitter
      t.integer :user_id
      t.integer :canvas_id
      t.integer :id_case

      t.timestamps
    end
  end
end
