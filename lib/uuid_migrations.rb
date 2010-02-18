class UUIDTableDefinition
  def initialize decorated
    @decorated = decorated
  end

  def relationship other_obj, given_options={}
    options = {:limit=>36 }
    options.merge!(given_options)
    self.string other_obj.to_s+"_id", options
  end

  def method_missing sym, *options, &b
    @decorated.send sym, *options, &b
  end
end

module ActiveRecord::ConnectionAdapters::SchemaStatements

  alias :create_table_without_uuid :create_table

  def create_table name, options={}, &block
    options[:id] = false
    create_table_without_uuid name, options do |t|
      ut = UUIDTableDefinition.new t
      ut.string :id, :limit=> 36, :null=> false
      block.call(ut)
    end
  end
end
