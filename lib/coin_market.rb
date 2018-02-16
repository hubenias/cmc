require_relative 'db'

class CoinMarket
  class << self
    def create(values)
      query = 'INSERT INTO coins_market(coin_id, rank, market_cap, price, circ_supply, time)
              VALUES($1, $2, $3, $4, $5, $6)'

      values_to_save = prepare_values(values)
      # DB.conn.prepare(st_name, query) # this does not work as supposed
      # DB.conn.exec_prepared(st_name, values_to_save)
      DB.conn.exec_params(query, values_to_save)
    end

    def report(date = nil)
      query = <<-SQL
        SELECT
          cm.rank, c.name, cm.market_cap, cm.price, 0 AS avg_price,
          0 AS coin_price, cm.circ_supply, 0 AS change
        FROM
          coins_market cm
          JOIN coins c ON cm.coin_id = c.id
        ORDER BY
          cm.rank, cm.time DESC;
      SQL
      DB.conn.exec(query).to_a
    end

    def all
      DB.conn.exec('select * from coins_market').to_a
    end

    private

    def prepare_values(values)
      columns = %w(id rank market_cap_usd price_usd available_supply time)
      res = columns.map do |col|
        values[col]
      end
      puts res # TODO: remove this line after debug
      res
    end
  end
end