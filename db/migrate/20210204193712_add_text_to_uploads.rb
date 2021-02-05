class AddTextToUploads < ActiveRecord::Migration[6.1]
  def up
    drop_table :uploads

    create_table :uploads do |t|
      t.string :text
      t.timestamps
    end
  end

  def down
    remove_column :uploads, :text, :string
  end
end
