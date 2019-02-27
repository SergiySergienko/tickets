class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :enquiry, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
