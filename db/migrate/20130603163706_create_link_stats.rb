class CreateLinkStats < ActiveRecord::Migration
  def change
    create_table :link_stats do |t|
      t.integer :link_id
      t.integer :like_count
      t.integer :share_count
      t.integer :comment_count

      t.timestamps
    end
  end
end
