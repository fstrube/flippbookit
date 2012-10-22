require "sinatra"
require "sinatra/reloader" if settings.environment == :development
require "aws/s3"

# Setup Amazon S3 using Heroku config
set :bucket, ENV['S3_BUCKET_NAME'] || 'flippbookit-uploads'
set :s3_key, ENV['AWS_ACCESS_KEY'] || 'AWS_ACCESS_KEY'
set :s3_secret, ENV['AWS_SECRET_ACCESS_KEY'] || 'AWS_SECRET_ACCESS_KEY'

get "/" do
  haml :index, :layout => :default
end

post "/" do
  # File.open('uploads/' + params['image'][:filename], "w") do |f|
  #   f.write(params['image'][:tempfile].read)
  # end
  unless params[:image] && (tmpfile = params[:image][:tempfile]) && (name = params[:image][:filename])
    return haml(:upload)
  end
  while blk = tmpfile.read(65536)
    AWS::S3::Base.establish_connection!(
    :access_key_id     => settings.s3_key,
    :secret_access_key => settings.s3_secret)
    AWS::S3::S3Object.store(name,open(tmpfile),settings.bucket,:access => :public_read)
  end
  redirect back
end
