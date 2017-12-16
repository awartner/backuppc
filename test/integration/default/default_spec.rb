status = 'sudo -u backuppc /usr/share/backuppc/bin/BackupPC_serverMesg status'

describe command(status) do
  its('stdout') { should match(/Got reply: ok/) }
end

describe http('http://localhost',
              enable_remote_worker: true,
              ssl_verify: false) do
  its('status') { should cmp 301 }
end

describe http('https://localhost',
              auth: { user: 'admin', pass: 'admin' },
              enable_remote_worker: true,
              ssl_verify: false) do
  its('status') { should cmp 200 }
  its('body') { should match(/BackupPC Server Status/) }
end
