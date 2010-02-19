$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'u_u_i_d_table_definition'

require 'rubygems'
require 'active_record'

describe UUIDTableDefinition do

  it "should be instanciated correctly" do
    td = mock("TableDefinition")
    UUIDTableDefinition.new td
  end

  it "should have a relationship method that works" do
    td = mock("TableDefinition")
    td.should_receive(:string).with("table_id", {:limit=>36}).and_return :true
    uuid = UUIDTableDefinition.new td
    uuid.relationship :table
  end

  it "should redirect to the decorated option when calling any other method" do
    td = mock("TableDefinition")
    td.should_receive(:string).with("aa").and_return :true
    td.should_receive(:integer).with("bb").and_return :true
    td.should_receive(:timestamps).and_return :true
    td.should_receive(:string).with("cc", :null=> false).and_return :true

    uuid = UUIDTableDefinition.new td
    uuid.string "aa"
    uuid.integer "bb"
    uuid.timestamps
    uuid.string "cc", :null=> false
  end

end

