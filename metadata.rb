name             'stacker_file'
maintainer       'stacker-project'
maintainer_email 'stacker-project@phoenection.com'
license          'Apache 2.0'
description      'stacker_file helps download remote files from s3 and other resources'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

recipe 'stacker_file::default', 'The only recipe to call to install the necessary dependencies and use the LWRP'

supports 'amazon', '>= 2013.09.1'
