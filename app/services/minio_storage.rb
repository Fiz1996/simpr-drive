require 'net/http'
require 'uri'
require 'base64'
require 'logger'

class MinioStorage

    
  MINIO_ENDPOINT = ENV['MINIO_ENDPOINT']
  BUCKET = ENV['MINIO_BUCKET']
  ACCESS_KEY = ENV['MINIO_ACCESS_KEY']
  SECRET_KEY = ENV['MINIO_SECRET_KEY']



  def self.store(id, data)
    puts("testing minio")
    uri = URI("#{MINIO_ENDPOINT}/#{BUCKET}/#{id}")
    puts(uri)

    req = Net::HTTP::Put.new(uri)
    req.body = Base64.decode64(data)
    req.basic_auth(ACCESS_KEY, SECRET_KEY)

    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(req)
    end
  end

  def self.retrieve(id)
    uri = URI("#{MINIO_ENDPOINT}/#{BUCKET}/#{id}")
    req = Net::HTTP::Get.new(uri)
    req.basic_auth(ACCESS_KEY, SECRET_KEY)

    res = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(req)
    end

    Base64.encode64(res.body) if res.is_a?(Net::HTTPSuccess)
  end
end
