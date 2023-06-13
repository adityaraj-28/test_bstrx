#!/bin/bash


filename="test_urls.txt"
collection=1

while IFS= read -r url || [[ -n "$url" ]]; do
    echo "Executing command for URL: $url"
    docker run -v /Users/aditya.raj/PycharmProjects/test_bstrx/crawls:/crawls/ --name crawler webrecorder/browsertrix-crawler crawl --url "$url" --generateWARC --text --collection "$collection" --w 3 --scopeType page-spa --combineWARC true --waitUntil networkidle0 --timeout 30
    docker rm -f crawler
    ((collection++))
done < "$filename"

#docker run -v /Users/aditya.raj/PycharmProjects/test_bstrx/crawls:/crawls/ --name crawler webrecorder/browsertrix-crawler crawl --url "$url" --generateWARC --text --collection "$collection" --w 3 --scopeType page-spa --combineWARC true --waitUntil networkidle0 --timeout 30
