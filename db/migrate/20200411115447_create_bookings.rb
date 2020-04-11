class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :session_id
      t.string :user_id

      t.timestamps
    end
  end
end
