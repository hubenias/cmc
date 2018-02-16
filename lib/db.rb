require 'pg'
require 'singleton'

class DB
  # TODO: it'd be nice to have this value in some config file
  DB_NAME = 'cmc'.freeze
  include Singleton
  def self.conn
    instance.conn
  end

  def conn
    @conn ||= PG.connect(dbname: 'cmc')
  end
end