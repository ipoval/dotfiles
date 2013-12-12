unless File.exists? '/usr/local/aws'
  tmp_file = '/tmp/awscli-bundle.zip'

  remote_file tmp_file do
    source 'https://s3.amazonaws.com/aws-cli/awscli-bundle.zip'
    owner node['user']
  end

  execute 'install' do
    cwd '/tmp'

    command %Q(
      unzip awscli-bundle.zip;
      \rm #{tmp_file};
      ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws;
    )

    user node['user']
  end
end
