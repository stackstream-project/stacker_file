action :create_if_missing do
  download(@new_resource.remote_path, @new_resource.path)

  new_resource.updated_by_last_action(true)
end

action :nothing do
  file @new_resource.path do
    action :nothing
  end
end
