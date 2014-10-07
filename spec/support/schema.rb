ActiveRecord::Schema.define do
  self.verbose = false

  create_table(:users) do |t|
    t.string :name
    t.string :uuid
    t.timestamps
  end
end
