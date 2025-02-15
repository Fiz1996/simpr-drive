class CreateBlobs < ActiveRecord::Migration[8.0]
  def change
    create_table :blobs do |t|
      t.string :storage_type
      t.string :path
      t.integer :size

      t.timestamps
    end
  end
end
