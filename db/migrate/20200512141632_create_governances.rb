class CreateGovernances < ActiveRecord::Migration[5.2]
  def change
    create_table :governances do |t|
      t.string :title
      t.date :issued

      t.timestamps
    end
  end
end
