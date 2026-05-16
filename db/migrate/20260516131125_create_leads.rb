class CreateLeads < ActiveRecord::Migration[7.1]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :phone
      t.string :status
      t.string :source
      t.string :priority

      t.timestamps
    end
  end
end
