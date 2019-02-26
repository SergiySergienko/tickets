class CreateEnquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :enquiries do |t|
      t.string :ref_id
      t.string :name
      t.string :email
      t.string :department
      t.string :subject
      t.string :message

      t.timestamps
    end
  end
end
