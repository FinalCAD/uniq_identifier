require 'active_record'

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
ActiveRecord::Base.extend UniqIdentifier

load File.dirname(__FILE__) + '/../schema.rb'

class User < ActiveRecord::Base
  uniq_identifier
end
