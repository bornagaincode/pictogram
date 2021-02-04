class AddTextToUploads < ActiveRecord::Migration[6.1]
  def change
    add_column :uploads, :text, :string
  end
end
