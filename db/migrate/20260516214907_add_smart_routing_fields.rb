class AddSmartRoutingFields < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :skill_level, :integer, default: 0
    add_column :users, :languages, :string, array: true, default: []
    add_column :users, :regions, :string, array: true, default: []
    add_column :users, :active_leads_count, :integer, default: 0

    add_column :leads, :language, :string
    add_column :leads, :region, :string
    add_column :leads, :score, :integer, default: 0
  end
end