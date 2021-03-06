e = execute "yum install -y -q libxml2 libxml2-devel libxslt libxslt-devel gcc gcc-c++" do
  action :nothing
  not_if { `rpm -qa libxml2 libxml2-devel libxslt libxslt-devel gcc gcc-c++`.split("\n").length == 5 }
end

e.run_action(:run)

chef_gem "excon" do
  version "0.31.0"
  action :install
end

chef_gem "unf" do
  version "0.1.3"
  action :install
end

chef_gem "fog" do
  version "1.19.0"
  action :install
end

require 'fog'
