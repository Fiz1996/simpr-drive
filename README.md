

simple_drive/
│── app/
│   ├── controllers/
│   │   ├── application_controller.rb
│   │   ├── blobs_controller.rb
│   │
│   ├── models/
│   │   ├── blob.rb
│   │
│   ├── services/
│   │   ├── storage_service.rb
│   │   ├── minio_storage.rb
│   │   ├── database_storage.rb
│   │   ├── local_storage.rb
│   │   ├── ftp_storage.rb
│
│── config/
│   ├── environments/
│   │   ├── development.rb
│   │   ├── production.rb
│   │   ├── test.rb
│   │
│   ├── routes.rb
│   ├── application.rb
│
│── db/
│   ├── migrate/
│   │   ├── 20250209123456_create_blobs.rb  # Migration for blobs table
│   ├── schema.rb
│
│── spec/
│   ├── requests/
│   │   ├── blobs_spec.rb  
│
│── .env 
│── .gitignore
│── Gemfile
│── Gemfile.lock
│── Rakefile
│── README.md
│── config.ru
│── storage/ 