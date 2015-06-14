class CreateContactJoiners < ActiveRecord::Migration
  def change
    create_table :contact_joiners do |t|
      t.integer :group_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
