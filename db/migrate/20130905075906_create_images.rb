class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string        :url
      t.attachment    :asset
      t.string        :dimensions
    end
  end
end
