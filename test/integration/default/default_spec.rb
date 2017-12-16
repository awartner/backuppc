status = 'sudo -u backuppc /usr/share/backuppc/bin/BackupPC_serverMesg status'

describe command(status) do
  its('stdout') { should match(/Got reply: ok/) }
end

%w(http://localhost https://localhost).each do |uri|
  describe http(uri,
                auth: { user: 'admin', pass: 'admin' },
                enable_remote_worker: true,
                ssl_verify: false) do
    its('status') { should cmp 200 }
    its('body') { should cmp '<title>BackupPC Server Status</title>' }
  end
end
