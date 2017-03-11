class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :admin_user
      t.string :domain_name
      t.string :doc_service_name
      t.string :osn_service_name
      t.datetime :service_created_at
      t.boolean :is_terminated
      t.integer :instances_per_account

      t.timestamps
    end
  end
end
