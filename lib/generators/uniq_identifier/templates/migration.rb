class AddUuid<%= class_name %> < ActiveRecord::Migration
  disable_ddl_transaction!
  def change
    change_table(:<%= plural_name %>) do |t|
      t.string :uuid, :string, limit: 40
    end
    add_index(:<%= plural_name %>, :uuid, unique: true)
  end
end
