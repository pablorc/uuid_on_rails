module ActiveRecord
  module ConnectionAdapter
    class MysqlAdapter < AbstractAdapter
      NATIVE_DATABASE_TYPES[:primary_key] = "varchar(36) DEFAULT NULL PRIMARY KEY"
    end
  end
end