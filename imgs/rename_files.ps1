ls temp/*

$files = Get-ChildItem "./temp/*"

$count = 1

foreach ($file in $files) {
	echo "moving $file to $count.png"
	mv "$file" "./cycle/$count.png"
	$count++
}
