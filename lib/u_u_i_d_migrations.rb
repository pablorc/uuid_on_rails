require 'u_u_i_d_table_definition'

# THANKS TO SVEN FUCHS
# http://www.artweb-design.de/2007/4/7/allow-custom-column-types-in-your-rails-migrations
# Plugin downloadable in http://svn.artweb-design.de/stuff/rails/migration_custom_column_types/
# This method allows to use custom types in database migrations
ActiveRecord::ConnectionAdapters::SchemaStatements.module_eval do
  def type_to_sql_with_custom_type(type, *params)
    return type unless native_database_types.has_key? type
    type_to_sql_without_custom_type(type, *params)
  end
  alias_method_chain :type_to_sql, :custom_type
end

#Changing the method create_table to allow uuid
module ActiveRecord
  module ConnectionAdapters
    module SchemaStatements

      alias :create_table_without_uuid :create_table

      #Equals to ActiveRecord::ConnectionAdapters::SchemaStatements#create_table
      def create_table name, options={}, &block

        create_table_without_uuid name, options do |t|
          #Using the decoration
          ut = UUIDTableDefinition.new t
          #Creates the id column as a string with limit==36
          #And creates the rest
          block.call(ut) if block_given?

        end
      end
    end
  end
end