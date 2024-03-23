class CreateMultiDayEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :multi_day_events do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
