# Decoration for ActiveRecord::ConnectionAdapters::TableDefinition to save
# UUID columns transparently
class UUIDTableDefinition

  #Receipts a decoration (ActiveRecord::ConnectionAdapters::TableDefinition)
  def initialize decorated
    @decorated = decorated
#    @decorated.columns << UUIDColumnDefinition.new
  end

  #Method for create foreign keys. With the model's name (underscored and singular)
  # the method creates a column xxx_id with the required type.
  # Also, it's possible to add additional options, as :null=>false/true
  #
  #e.g.:
  # create_table :engine, :force=>true do |t|
  #  t.relationship :car, :null=>id
  #  t.integer :power
  # end
  def relationship other_obj, given_options={}
    options = {:limit=>36 }
    options.merge!(given_options)
    create_uuid_column other_obj.to_s+"_id"
  end

  #Send any unknown message to the real object TableDefinition
  def method_missing sym, *options, &b
    @decorated.send sym, *options, &b
  end

  private
  def create_primary_uuid_key
    create_uuid_column :id
  end

  def create_uuid_column name
   self.column name, 'varbinary(16)'
  end
end
