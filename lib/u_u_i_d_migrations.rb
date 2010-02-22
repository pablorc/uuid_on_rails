require 'u_u_i_d_table_definition'

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