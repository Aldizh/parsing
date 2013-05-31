#!/bin/sh
ruby csvify.rb $1 > mail.csv 
ruby tokenize.rb < mail.csv > tokens.csv
sed 1d tokens.csv | sort -t, -k2  | ruby count.rb > token_counts.csv
echo "token,count" > state_counts.csv
egrep "^alabama,|^alaska,|^arizona,|^arkansas,|^california,|^colorado,|^connecticut,|^delaware,|^florida,|^georgia,|^hawaii,|^idaho,|^illinois,|^indiana,|^iowa,|^kansas,|^kentucky,|^louisiana,|^maine,|^maryland,|^massachusetts,|^michigan,|^minnesota," token_counts.csv >> state_counts.csv
egrep "^mississippi,|^missouri,|^montana,|^nebraska,|^nevada,|^hampshire,|^jersey,|^mexico,|^york,|^carolina,|^dakota,|^ohio,|^oklahoma,|^oregon,|^pennsylvania,|^rhode,|^carolina,|^dakota,|^tennessee,|^texas,|^utah,|^vermont,|^virginia,|^washington,|^virginia,|^wisconsin,|^wyoming," token_counts.csv >> state_counts.csv

exit 0
