module ActiveRecord
  module ConnectionAdapters
    class MysqlAdapter < AbstractAdapter
      def native_database_types
        {
          #        :primary_key => "int(11) DEFAULT NULL auto_increment PRIMARY KEY".freeze,
          :primary_key => "varchar(36) PRIMARY KEY".freeze,
          :string      => { :name => "varchar", :limit => 255 },
          :text        => { :name => "text" },
          :integer     => { :name => "int", :limit => 4 },
          :float       => { :name => "float" },
          :decimal     => { :name => "decimal" },
          :datetime    => { :name => "datetime" },
          :timestamp   => { :name => "datetime" },
          :time        => { :name => "time" },
          :date        => { :name => "date" },
          :binary      => { :name => "blob" },
          :boolean     => { :name => "tinyint", :limit => 1 }
        }
      end

    end
  end
end
