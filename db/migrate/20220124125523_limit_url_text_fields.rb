class LimitUrlTextFields < ActiveRecord::Migration[7.0]
  def change
    change_column :urls, :url, :string, :limit => 300
    change_column :urls, :name, :string, :limit => 20
  end
end
