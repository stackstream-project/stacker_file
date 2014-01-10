require 'digest/md5'
require 'fileutils'

begin
  require 'fog'
  include Fog::Storage
rescue LoadError
end

def download(remote_path, path)
  base = node[:stacker_file][:base]
  username = node[:stacker_file][:username]
  password = node[:stacker_file][:password]

  file_from_s3(base, remote_path, username, password, path)
end

def md5_from_s3(conn,bucket,remote_path)
  return object_headers_from_s3(conn,bucket,remote_path)["ETag"].gsub('"','')
end

def size_from_s3(conn,bucket,remote_path)
  return object_headers_from_s3(conn,bucket,remote_path)["Content-Length"].gsub('"','')
end

def object_headers_from_s3(conn,bucket,remote_path)
  return (conn.head_object(bucket, remote_path)).data[:headers]
end

def file_from_s3(base, remote_path, username, password, path)
  conn = Fog::Storage.new({ :provider => "AWS", :aws_access_key_id => username, :aws_secret_access_key => password })
  bucket = conn.directories.new(:key => base)

  s3_md5 = md5_from_s3(conn,base,remote_path)

  if File.exists?(path)
    file_md5 = Digest::MD5.file(path).to_s

    if s3_md5 == file_md5
      return true
    end
  end
  
  tmp_file = "#{Chef::Config[:file_cache_path]}/stacker_file.#{Time.now.to_i}"

  open(tmp_file, 'w') do |f|
    bucket.files.get(remote_path) do |chunk,remaining_bytes,total_bytes|
      f.write chunk
    end
  end

  file_md5 = Digest::MD5.file(tmp_file).to_s

  if file_md5 == s3_md5
    FileUtils.mv(tmp_file, path)
    return true
  else
    File.delete(tmp_file)
    raise Chef::Exceptions::RuntimeError, "md5 of file downloaded: #{file_md5} different then remote md5: #{s3_md5}"
  end
end
