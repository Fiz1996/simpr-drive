require 'logger'

class StorageService
  
    def store(id, data)
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
  