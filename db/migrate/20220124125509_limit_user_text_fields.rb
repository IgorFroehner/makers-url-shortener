class LimitUserTextFields < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :email, :string, :limit => 150
  end
end
