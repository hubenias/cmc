CREATE DATABASE cmc;
\connect cmc;

CREATE TABLE coins
(
    id VARCHAR(50) PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    symbol VARCHAR(100) NOT NULL
);
CREATE UNIQUE INDEX coins_id_uindex ON coins (id);

CREATE TABLE coins_market
(
  coin_id     VARCHAR(50)    NOT NULL
    CONSTRAINT coins_market_coins_id_fk
    REFERENCES coins,
  rank        INTEGER        NOT NULL,
  market_cap  NUMERIC(15)    NOT NULL,
  price       NUMERIC(15, 6) NOT NULL,
  circ_supply NUMERIC(15)    NOT NULL,
  time        TIMESTAMP      NOT NULL,
  id          SERIAL         NOT NULL
    CONSTRAINT coins_market_id_pk
    PRIMARY KEY
);

CREATE UNIQUE INDEX coins_market_id_uindex ON coins_market (id);

-- fill table with initial data - coins we're going to work with
INSERT INTO coins (id, name, symbol)
VALUES  ('bitcoin', 'Bitcoin', 'BTC'),
  ('ethereum', 'Ethereum', 'ETH'),
  ('ripple', 'Ripple', 'XRP'),
  ('bitcoin-cash', 'Bitcoin Cash', 'BCH'),
  ('litecoin', 'Litecoin', 'LTC'),
  ('cardano', 'Cardano', 'ADA'),
  ('stellar', 'Stellar', 'XLM'),
  ('neo', 'NEO', 'NEO'),
  ('eos', 'EOS', 'EOS'),
  ('iota', 'IOTA', 'MIOTA'),
  ('dash', 'Dash', 'DASH'),
  ('nem', 'NEM', 'XEM'),
  ('monero', 'Monero', 'XMR'),
  ('lisk', 'Lisk', 'LSK'),
  ('ethereum-classic', 'Ethereum Classic', 'ETC'),
  ('tron', 'TRON', 'TRX'),
  ('vechain', 'VeChain', 'VEN'),
  ('qtum', 'Qtum', 'QTUM'),
  ('bitcoin-gold', 'Bitcoin Gold', 'BTG'),
  ('tether', 'Tether', 'USDT'),
  ('icon', 'ICON', 'ICX');
