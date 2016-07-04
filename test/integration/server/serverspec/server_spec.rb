require 'spec_helper'

describe 'backuppc::server' do
  it 'reports its status' do
    status = 'sudo -u backuppc '\
             '/usr/share/backuppc/bin/BackupPC_serverMesg status'
    expect(command(status).stdout).to match(/Got reply: ok/)
  end
end
