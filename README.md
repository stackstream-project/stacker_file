# Description

stacker_file is an LWRP that downloads remote files from Amazon S3 and future remote file providers.

# Roadmap

1. <del>Download remote files from S3</del>
2. The next remote file content provider (TBD)

# Requirements

### Platform

* Amazon Linux

Tested on:

* Amazon Linux 6 - 2013.09.1

# Dependencies

* fog ruby gem

# Attributes

### Input

* `[:infrastructure_provider]` - remote file provider
* `[:stacker_file][:base]` - the S3 bucket or beginning directory path
* `[:stacker_file][:username]` - username to authenticate to the remote file provider
* `[:stacker_file][:password]` - password for the user authenticating to the remote file provider

### Output


# Usage

Use the default recipe while specifying the necessary attributes to deploy the application:

    include_recipe "stacker_file::default"

How to call it from another recipe:

    stacker_file "/var/tmp/archive_file" do
      remote_path "myassetfiles/archive_file"
    end

# License

[Stacker Project](http://stacker-project.github.io/) - Stack Management

|                      |                                                     |
|:---------------------|:----------------------------------------------------|
| **Author:**          | Stacker-Project (<stacker-project@phoenection.com>) |
| **Copyright:**       | Copyright (c) 2014 Phoenection                      |
| **License:**         | Apache License, Version 2.0                         |

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

