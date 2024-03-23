class CreateSingleDayEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :single_day_events do |t|
      t.string :name
      t.datetime :start_time

      t.timestamps
    end
  end
end
