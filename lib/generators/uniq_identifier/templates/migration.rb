class AddUuid<%= class_name %> < ActiveRecord::Migration
  def change
    change_table(:<%= plural_name %>) do |t|
      t.string :uuid
    end
    add_index(:<%= plural_name %>, :uuid)
  end
end
