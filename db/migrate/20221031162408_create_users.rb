class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :comments_count
      t.integer :likes_count
      t.boolean :private
      t.string :username
      t.integer :photos_count
      t.integer :sent_request_count
      t.integer :recipient_request_count

      t.timestamps
    end
  end
end
