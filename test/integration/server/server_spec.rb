status = 'sudo -u backuppc /usr/share/backuppc/bin/BackupPC_serverMesg status'

describe command(status) do
  its('stdout') { should match(/Got reply: ok/) }
end

describe http('http://localhost/backuppc', enable_remote_worker: true) do
  its('body') { should include '<title>401 Authorization Required</title>' }
end
