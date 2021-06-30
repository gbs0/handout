class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.string :title
      t.string :summary
      t.string :timestamp
      t.string :author
      t.string :localization
      t.string :status
      t.string :expiration_date
      t.string :last_process_date
      t.string :last_process_status
      t.integer :attachment_docs
      t.string :link
      t.string :report_link

      t.timestamps
    end
  end
end
