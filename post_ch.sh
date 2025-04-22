#!/bin/bash

echo "year,avg_fare" > fares_all.csv

for f in fares_*.txt; do
    year=$(echo $f | grep -oE '[0-9]{4}')
    avg=$(cat "$f")
    echo "$year,$avg" >> fares_all.csv
done

echo ✅"Merged all fares into fares_all.csv"
