#
# Cookbook Name:: aw_backuppc
# Spec:: server
#
# The MIT License (MIT)
#
# Copyright (c) 2016 Aaron Wartner
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'spec_helper'

describe 'aw_backuppc::server' do
  context 'When all attributes are default, on an unspecified platform' do
    cached(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    before do
      allow_any_instance_of(Chef::Recipe).to receive(:include_recipe)
        .and_call_original
      allow_any_instance_of(Chef::Recipe).to receive(:include_recipe)
        .with('nginx')
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'configures the BackupPC server' do
      expect(chef_run).to create_template('/etc/backuppc/config.pl')
        .with(owner: 'backuppc', group: 'www-data')
    end

    it 'reloads BackupPC after configuration changes' do
      resource = chef_run.template('/etc/backuppc/config.pl')
      expect(resource).to notify('service[backuppc]').to(:reload)
    end
  end
end
