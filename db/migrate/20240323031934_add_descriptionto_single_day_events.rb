class AddDescriptiontoSingleDayEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :single_day_events, :time, :time
    add_column :single_day_events, :notes, :string
    add_column :single_day_events, :location, :string
  
  end
end
