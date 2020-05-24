class AddPhotourlToGovernances < ActiveRecord::Migration[5.2]
  def change
    add_column :governances, :photo_url, :string
  end
end
