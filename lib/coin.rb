require_relative 'db'

class Coin
  def self.all
    DB.conn.exec('select * from coins').to_a
  end
end