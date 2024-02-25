class RemoveSheltersFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :shelters, :string
  end
end
