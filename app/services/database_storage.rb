class DatabaseStorage
    def self.store(id, data)
      Blob.create!(id: id, storage_type: 'db', size: data.length, created_at: Time.now)
    end
  
    def self.retrieve(id)
      blob = Blob.find_by(id: id)
      { id: blob.id, data: Base64.encode64(blob.data), size: blob.size, created_at: blob.created_at }
    end
  end
  