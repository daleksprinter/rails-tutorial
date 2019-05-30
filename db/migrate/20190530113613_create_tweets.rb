class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :user
      t.string :string
      t.string :tweet_id
      t.string :int
      t.string :good
      t.string :int

      t.timestamps
    end
  end
end
