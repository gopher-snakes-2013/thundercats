class CreateCommentsTable < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.text :content
      t.belongs_to :post

      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
