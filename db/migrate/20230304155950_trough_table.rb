class TroughTable < ActiveRecord::Migration[7.0]
  def change
    create_table :events_users, id: false do |t|
      t.bigint :user_id
      t.bigint :event_id
    end

    add_index :events_users, :user_id
    add_index :events_users, :event_id
  end
end
