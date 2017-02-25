json.extract! service, :id, :admin_user, :domain_name, :doc_service_name, :osn_service_name, :service_created_at, :is_terminated, :instances_per_account, :created_at, :updated_at
json.url service_url(service, format: :json)
