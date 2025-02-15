class LocalStorage
    STORAGE_PATH = ENV['LOCAL_STORAGE_PATH'] || 'storage'
  
    def self.store(id, data)
      File.write("#{STORAGE_PATH}/#{id}", Base64.decode64(data))
    end
  
    def self.retrieve(id)
      Base64.encode64(File.read("#{STORAGE_PATH}/#{id}")) if File.exist?("#{STORAGE_PATH}/#{id}")
    end
  end
  