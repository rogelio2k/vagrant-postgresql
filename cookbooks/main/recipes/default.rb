# fix issue with locales
include_recipe "main::fix_locale"

# postgresql server
include_recipe "postgresql::server"
include_recipe "postgresql::server_debian"

# override template from the postgresql cookbook
resources(:template => "#{node[:postgresql][:dir]}/pg_hba.conf").instance_exec do
	cookbook "main"
end
