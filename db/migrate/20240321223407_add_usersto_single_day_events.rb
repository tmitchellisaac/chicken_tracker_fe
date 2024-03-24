class AddUserstoSingleDayEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :single_day_events, :user, foreign_key: true
  end
end
