class ChangeColName < ActiveRecord::Migration
  def up
		rename_column :ads, :type, :real_estate
  end

  def down
  end
end
