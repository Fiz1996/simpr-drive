require 'net/ftp'

class FTPStorage
  FTP_HOST = ENV['FTP_HOST']
  FTP_USER = ENV['FTP_USER']
  FTP_PASS = ENV['FTP_PASS']

  def self.store(id, data)
    Net::FTP.open(FTP_HOST, FTP_USER, FTP_PASS) do |ftp|
      ftp.putbinaryfile(StringIO.new(Base64.decode64(data)), id)
    end
  end

  def self.retrieve(id)
    Net::FTP.open(FTP_HOST, FTP_USER, FTP_PASS) do |ftp|
      data = ftp.getbinaryfile(id, nil)
      Base64.encode64(data)
    end
  end
end
