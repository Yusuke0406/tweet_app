class RemoveImageFromTweets < ActiveRecord::Migration[5.0]
  def change
    remove_column :tweets, :image, :string
  end
end
