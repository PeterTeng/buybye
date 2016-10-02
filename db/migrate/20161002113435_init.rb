class Init < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp'

    create_table :users, id: :uuid, default: "uuid_generate_v4()" do |t|

      # for admin
      t.boolean :admin, null: false, default: false

      # for user
      t.string :email, null: false, uniqueness: true
      t.string :password_digest, null: false

      #user info
      t.text :introduce
      t.integer :gender
      t.integer :undergraduate
      t.integer :department

      #user links
      t.string :twitter_link
      t.string :facebook_link


      t.string :remember_digest
      t.string :reset_digest
      t.datetime :reset_sent_at
    end

    create_table :exhibits, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.uuid :user_id, null: false
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :status, null: false
      t.boolean :is_sold, null: false
      t.string :auther, null: false
    end

    create_table :colleges, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string :name, null: false, uniqueness: true
    end

    create_table :comments, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.uuid :user_id, null: false, index: true
      t.text :content, null: false
    end

  end
end
