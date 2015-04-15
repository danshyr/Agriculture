

library(RODBC);
channel = odbcConnect("agriculture", uid="sa", pwd="passw0rd");
market_banana = sqlQuery(channel, "select * from market_banana");
market_longan = sqlQuery(channel, "select * from market_longan");
market_loquat = sqlQuery(channel, "select * from market_loquat");
market_passionFruit = sqlQuery(channel, "select * from market_passionFruit");
market_persimmon = sqlQuery(channel, "select * from market_persimmon");
market_ponkan = sqlQuery(channel, "select * from market_ponkan");
banana_production_price = sqlQuery(channel, "select * from banana_production_price");
longan_production_price = sqlQuery(channel, "select * from longan_production_price");
loquat_production_price = sqlQuery(channel, "select * from loquat_production_price");
passionFruit_production_price = sqlQuery(channel, "select * from passionFruit_production_price");
persimmon_production_price = sqlQuery(channel, "select * from persimmon_production_price");
ponkan_production_price = sqlQuery(channel, "select * from ponkan_production_price");
price_index = sqlQuery(channel, "select * from price_index");
production = sqlQuery(channel, "select * from production");
typhoon = sqlQuery(channel, "select * from typhoon");
weather = sqlQuery(channel, "select * from weather");
close(channel);

