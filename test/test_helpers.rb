ENV['RACK_ENV'] = 'test'

require_relative '../init'
require 'minitest/autorun'
require 'sinatra/activerecord'

ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.logger.level = Logger::ERROR

module TestHelpers
  module_function

  def db_clear
    ActiveRecord::Base.transaction do
      ActiveRecord::Base.descendants.each do |model|
        model.delete_all
      end
    end
  end

  def db_table_to_model
    pairs = ActiveRecord::Base.descendants.map {|klass| [klass.table_name, klass] }
    Hash[pairs].with_indifferent_access
  end

  def db_init(spec)
    models = db_table_to_model
    ActiveRecord::Base.transaction do
      spec.each do |table, rows|
        model = models[table]
        rows.each do |row|
          model.create! row
        end
      end
    end
  end

  def init(spec = nil)
    db_clear
    return if spec.nil?
    db_init(spec)
  end


end

