class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true
      t.references :track, index: true

      t.timestamps
    end
    execute "ALTER TABLE likes ADD PRIMARY KEY (user_id,track_id);"
  end
end
