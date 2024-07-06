<?php
$tz = getenv('TZ');
$timestamp = time();
$dt = new DateTime('now', new DateTimeZone($tz)); //first argument "must" be a string
$dt->setTimestamp($timestamp); //adjust the object to correct timestamp
$text = $dt->format('d.m.Y, H:i:s');
?>
<!doctype html>
<html>
  <head>
    <title>This is the title of the webpage!</title>
  </head>
  <body>
    <p>This is an example paragraph. <?php echo $text; ?><br>Anything in the <strong>body</strong> tag will appear on the page, just like this <strong>p</strong> tag and its contents.</p>
  </body>
</html>
