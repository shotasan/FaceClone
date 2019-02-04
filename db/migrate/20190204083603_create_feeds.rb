class CreateFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds do |t|
      t.string :image
      t.string :text

      t.timestamps
    end
  end
end
