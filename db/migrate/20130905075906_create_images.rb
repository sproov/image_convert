class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer       :external_id
      t.integer       :producer_id
      t.string        :url
      t.attachment    :asset
      t.boolean       :processed,     default: false
      t.string        :dimensions

      t.timestamps
    end
    add_index :images, :external_id
    add_index :images, :producer_id
  end
end
