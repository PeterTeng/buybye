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
      t.string :name
      t.text :introduce
      t.string :image
      t.string :cover_image
      t.integer :gender
      t.integer :undergraduate
      t.integer :department
      t.uuid :favorites, array: true

      #user links
      t.string :twitter_link
      t.string :facebook_link

      #user evaluation
      t.integer :good_evaluation_count, null: false, default: 0
      t.integer :neutral_evaluation_count, null: false, default: 0
      t.integer :bad_evaluation_count, null: false, default: 0


      t.string :remember_digest
      t.string :reset_digest
      t.datetime :reset_sent_at
    end

    create_table :items, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string :type, null: false, default: "Exhibit"
      t.uuid :user_id, null: false, index: true
      t.uuid :college_id, null: false, index: true
      t.string :depertment_id, null: false, index: true
      t.string :undergraduate_id, null: false, index: true
      t.string :name, null: false
      t.boolean :is_pickup, null: false, default: false
      t.integer :price, null: false
      t.text :description, null: false
      t.integer :transaction_status, null: false, default: 0
      t.integer :preservation_status, null: false
      t.boolean :is_sold, null: false, default: false
      t.string :auther
    end

    create_table :item_images, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.uuid :item_id, null: false, index: true
      t.string :image, null: false
    end

    create_table :favorites do |t|
      t.uuid :user_id, null: false, index: true
      t.uuid :item_id, null: false, index: true
    end

    create_table :colleges, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string :name, null: false, uniqueness: true
    end

    create_table :depertments do |t|
      t.uuid :college_id, null: false, index: true
      t.string :name, null: false
    end

    create_table :undergraduates do |t|
      t.uuid :college_id, null: false, index: true
      t.string :depertment_id, null: false, index: true
      t.string :name, null: false
    end

    create_table :lectures do |t|
      t.string :name, null: false
      t.string :professor_name, null: false
      t.string :department, null: false
      t.string :periods, null: false, array: true, default: []
      t.string :weekday, null: false
      t.string :semester, null: false
    end

    create_table :comments, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.uuid :user_id, null: false, index: true
      t.uuid :item_id, null: false, index: true
      t.text :content, null: false
    end

    create_table :chat_rooms, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.uuid :exhibit_id, null: false, index: true
    end

    create_table :chat_users, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.uuid :user_id, null: false, index: true
      t.uuid :chat_room_id, null: false, index: true
    end

    create_table :messages, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.text :content, null: false
      t.boolean :is_read, null: false, default: false
    end

  end
end
