class CreateTweetToBlocks < ActiveRecord::Migration
  def change
    create_table :tweet_to_blocks do |t|
      t.belongs_to :tweet
      t.integer :id_case

      t.timestamps
    end
  end
end
