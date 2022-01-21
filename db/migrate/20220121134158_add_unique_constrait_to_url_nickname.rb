class AddUniqueConstraitToUrlNickname < ActiveRecord::Migration[7.0]
  def change
    add_index :urls, :name, :unique => true
  end
end
