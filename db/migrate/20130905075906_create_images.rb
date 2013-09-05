class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string        :url
      t.attachment    :asset
      t.boolean       :processed,     default: false
      t.string        :dimensions

      t.timestamps
    end
  end
end
