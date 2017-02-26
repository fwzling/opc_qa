class ChangeServiceCreateOnTime < ActiveRecord::Migration[5.0]
  def change
    change_column :services, :service_created_at, :datetime
  end
end
