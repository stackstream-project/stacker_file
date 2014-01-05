actions :create_if_missing, :nothing
default_action :create_if_missing

attribute :path, :kind_of => String, :name_attribute => true
attribute :remote_path, :required => true, :kind_of => String

def initialize(*args)
  super
  @action = :create_if_missing
end
