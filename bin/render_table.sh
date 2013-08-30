file="`dirname $1`/_$2-$3.html"

echo "<doctype html>
<html>
<head>
  <title>$2 - $3</title>
  <meta charset=\"utf-8\" />
  <style>
    tr {
      text-align: right;
    }
  </style>
</head>
<body>
  <table id=\"tbl\" class=\"tablesorter\">
    <thead>
      <tr>
	<th>Implementation</th>
	<th>Handshake Time (mean)</th>
	<th>Handshake Time (stddev)</th>
	<th>Handshake Time (median)</th>
	<th>Handshake Time (95%)</th>
	<th>Handshake Time (99%)</th>
	<th>Handshake Time (99.9%)</th>
	<th>Latency (mean)</th>
	<th>Latency (stddev)</th>
	<th>Latency (median)</th>
	<th>Latency (95%)</th>
	<th>Latency (99%)</th>
	<th>Latency (99.9%)</th>
	<th>Connection Timeouts</th>
      </tr>
   </thead>
   <tbody>" > $file

for db_path in "$1"/*; do
	server=`basename $db_path`
	./bin/render_table "$1$server/" >> $file
done

echo "</tbody></table></body></html>" >> $file

