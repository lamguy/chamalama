class CreateTimelineMaps < ActiveRecord::Migration
  def change
    create_table :timeline_maps do |t|
      t.references :timeline, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
