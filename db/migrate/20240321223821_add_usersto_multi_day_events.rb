class AddUserstoMultiDayEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :multi_day_events, :user, foreign_key: true
  end
end
