rm ../out_features.csv/* ../features.csv
rm ../out_players.csv/* ../players_features.csv

hadoop fs -get /user/ahaeflig/out/out_features.csv/part-00000 ../features.csv
hadoop fs -get /user/ahaeflig/out/out_players.csv/part-00000 ../players_features.csv
