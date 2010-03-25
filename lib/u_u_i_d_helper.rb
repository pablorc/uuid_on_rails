require 'rubygems'
require 'uuidtools'

module UUIDHelper
  def before_create
    self.id = UUIDTools::UUID.random_create.raw if self.id.nil? or self.id.empty?
    yield if block_given?
  end
end