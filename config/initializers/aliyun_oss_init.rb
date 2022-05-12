require 'aliyun/oss'

module OSS
  def self.client
    unless @client
      Aliyun::Common::Logging.set_log_file('./log/oss_sdk.log')

      @client = Aliyun::OSS::Client.new(
          endpoint: ENV['OSS_ENDPOINT'],
          access_key_id: ENV['OSS_ID'],
          access_key_secret: ENV['OSS_SECRET'])
    end

    @client
  end

  def self.bucket
    unless @bucket
      bucket_name = ENV['BUCKET_NAME']

      unless self.client.bucket_exists?(bucket_name)
        self.client.create_bucket(bucket_name)
      end

      @bucket = self.client.get_bucket(bucket_name)
      @bucket.acl = 'public-read'
    end

    @bucket
  end
end
