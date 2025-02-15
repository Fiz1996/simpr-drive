require 'logger'

class StorageService
    def initialize
      # @backend = ENV['STORAGE_BACKEND'] || 'local'
      @backend = 'minio' 
      @logger = Logger.new(STDOUT)  # Logs to standard output (console)
      @logger.level = Logger::INFO 
    end
  
    def store(id, data)
      @logger.info("Storage backend is: #{@backend}")  # Log the backend type
      case @backend
      when 'minio' then MinioStorage.store(id, data)
      when 'db' then DatabaseStorage.store(id, data)
      when 'local' then LocalStorage.store(id, data)
      when 'ftp' then FTPStorage.store(id, data)
      else raise "Unknown backend: #{@backend}"
      end
    end
  
    def retrieve(id)
      case @backend
      when 'minio' then MinioStorage.retrieve(id)
      when 'db' then DatabaseStorage.retrieve(id)
      when 'local' then LocalStorage.retrieve(id)
      when 'ftp' then FTPStorage.retrieve(id)
      else raise "Unknown backend: #{@backend}"
      end
    end
  end
  