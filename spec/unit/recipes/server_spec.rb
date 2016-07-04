#
# Cookbook Name:: backuppc
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'backuppc::server' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
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
