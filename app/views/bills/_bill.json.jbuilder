json.extract! bill, :id, :title, :summary, :timestamp, :author, :localization, :status, :expiration_date, :last_process_date, :last_process, :attachment_docs, :link, :created_at, :updated_at
json.url bill_url(bill, format: :json)
