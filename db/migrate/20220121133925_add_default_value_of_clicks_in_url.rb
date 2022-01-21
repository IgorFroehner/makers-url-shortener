class AddDefaultValueOfClicksInUrl < ActiveRecord::Migration[7.0]
  def change
    change_column_default :urls, :clicks, 0
  end
end
