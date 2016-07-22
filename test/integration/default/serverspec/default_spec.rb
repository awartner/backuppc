require 'spec_helper'

describe 'aw_backuppc::default' do
  it 'reports an okay status' do
    status = 'sudo -u backuppc '\
             '/usr/share/backuppc/bin/BackupPC_serverMesg status'
    expect(command(status).stdout).to match(/Got reply: ok/)
  end

  it 'loads a CGI page' do
    expect(command('curl http://localhost/backuppc').stdout).to match('<head><title>401 Authorization Required</title></head>')
  end
end
