class AddUserRefToFeeds < ActiveRecord::Migration[5.1]
  def change
    # feedsテーブルにuserカラムを追加する
    add_reference :feeds, :user, foreign_key: true
  end
end
