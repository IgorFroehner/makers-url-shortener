class AddUserToUrls < ActiveRecord::Migration[7.0]
  def change
    Url.delete_all
    add_reference :urls, :user, null: false, foreign_key: true
  end
end
