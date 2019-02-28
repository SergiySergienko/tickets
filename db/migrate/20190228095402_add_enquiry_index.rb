class AddEnquiryIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :enquiries, :ref_id
  end
end
