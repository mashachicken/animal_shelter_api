class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :animals, :type, :breed
  end
end
