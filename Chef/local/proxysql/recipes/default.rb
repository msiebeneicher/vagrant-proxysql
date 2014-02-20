#
# Cookbook Name:: proxysql
# Recipe:: default
#
# Copyright 2014, Marc Siebeneicher
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0c
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "git"
include_recipe "apt"

bash "update apt" do
	code <<-EOF
	sudo apt-get update
	EOF
end

# Needed to compile / bundle install it
apt_package "libssl-dev" do
  action :install
end

apt_package "libglib2.0-dev" do
  action :install
end

apt_package "libmysqlclient-dev" do
  action :install
end

apt_package "make" do
  action :install
end

# checkout proxysql from git
git "/home/vagrant/proxysql" do
  repository "git://github.com/renecannao/proxysql.git"
  revision "master"
  action :sync
end

# compile proxysql
bash "install proxysql" do
	cwd "/home/vagrant/proxysql/src"
	code <<-EOF
	make
	EOF
	#not_if "/home/vagrant/proxysql/proxysql.cnf"
end