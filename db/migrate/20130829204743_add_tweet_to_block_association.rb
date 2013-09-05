class AddTweetToBlockAssociation < ActiveRecord::Migration
  def change
    create_table :blocks_tweets do |t|
      t.belongs_to :tweet
      t.belongs_to :block
    end
  end
end
