class BlobsController < ApplicationController
    before_action :authenticate_request
  
    def create
      id = params[:id]
      data = params[:data]
  
      return render json: { error: 'Invalid Base64' }, status: :unprocessable_entity unless valid_base64?(data)
  
      StorageService.new.store(id, data)
      Blob.create!(id: id, storage_type: ENV['STORAGE_BACKEND'], size: Base64.decode64(data).bytesize, created_at: Time.now)
  
      render json: { id: id, message: 'Stored successfully' }
    end
  
    def show
      id = params[:id]
      blob = StorageService.new.retrieve(id)
  
      return render json: { error: 'Not found' }, status: :not_found unless blob
  
      render json: { id: id, data: blob, size: blob.length, created_at: Time.now.utc }
    end
  
    private
  
    def authenticate_request
      token = request.headers['Authorization']&.split(' ')&.last
      return render json: { error: 'Unauthorized' }, status: :unauthorized unless token == ENV['AUTH_TOKEN']
    end
  
    def valid_base64?(str)
      str.match?(/\A[A-Za-z0-9+\/=]+\z/)
    end
  end
  