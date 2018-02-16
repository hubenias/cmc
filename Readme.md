Exchanger
---------
1. Setup:
    * install `postresql`
    * run `bundle`
    * `psql -a -f db_setup.sql`

2. Usage:
    * `rackup`
    * I tried to use such crontab job:
        `*/10 * * * * ruby /Users/serhii/Projects/bmt/lib/coin_market_cap_importer.rb`
    * otherwise `ruby lib/coin_market_cap_importer.rb` can be run in order to fetch new data
    

3. To do:
    - that widget for navigation through history
    - nice design
