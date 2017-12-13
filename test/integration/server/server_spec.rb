status = 'sudo -u backuppc /usr/share/backuppc/bin/BackupPC_serverMesg status'

describe command(status) do
  its('stdout') { should match(/Got reply: ok/) }
end

describe http('http://localhost',
              auth: { user: 'admin', pass: 'admin' },
              enable_remote_worker: true) do
  its('body') { should include '<title>BackupPC Server Status</title>' }
end
