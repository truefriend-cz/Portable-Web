<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/css/uikit.min.css" />
    <title>Hello world!</title>
</head>
<body uk-scrollspy="target: > div; cls:uk-animation-fade; delay: 200">
<div class="uk-position-center uk-text-center">
    <p><h1><div class="uk-placeholder">Hello world!</div></h1>
    <a href="http://pma.localhost/"><img data-src="phpmyadmin.jpg" width="30%" height="30%" alt="" uk-img></a></p>
     <p class="uk-text-muted"><?php print date('Y-m-d H:i:s');?></p>
    <p><?php print "Upload your index files to:<br><span class='uk-label uk-label-warning'><q>".dirname(__FILE__)."</q></span>";?></p>

    <div class="uk-flex uk-flex-center ">
        <div class="uk-card uk-card-default uk-card-body">
            <?php if ($c=preg_match_all ("/".'((?:[a-z][a-z0-9_]*))'.'.*?'.'((?:[0]?[1-9]|[1][012])[-:\\/.](?:(?:[0-2]?\\d{1})|(?:[3][01]{1}))[-:\\/.](?:(?:\\d{1}\\d{1})))(?![\\d])'."/is", strtoupper($_SERVER['SERVER_SOFTWARE']), $matches)){
            $_getServer=$matches[1][0];
            $_getVersion=$matches[2][0];
            print "<span class='uk-label'>$_getServer</span><br><q>Version ".$_getVersion."</q>";} ?>
        </div>
        <div class="uk-card uk-card-default uk-card-body uk-margin-center">
            <?php
            $pdo = new PDO("mysql:host=localhost;dbname=mysql", "root");
            $stm = $pdo->query("SELECT VERSION() LIMIT 1");
            $version = $stm->fetch();
            print "<span class='uk-label'>MySQL</span><br><q>Version ".$version[0]."</q>";
            ?>
        </div>

        <div class="uk-card uk-card-default uk-card-body uk-margin-center">
            <?php print "<span class='uk-label'>phpMyAdmin</span><br>"."<q>".trim(file("../phpMyAdmin/README")[3])."</q>"; ?>
        </div>
        <div class="uk-card uk-card-default uk-card-body uk-margin-center">
            <?php print "<span class='uk-label'>PHP</span><br>"."<q>Version ".phpversion().phpversion('tidy')."</q>"; ?>
        </div>
    </div>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit-icons.min.js"></script>
</html>