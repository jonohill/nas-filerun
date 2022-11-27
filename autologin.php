<?php

session_name('FileRunSID');
session_start();

$_SESSION['FileRun']['username'] = $_ENV["AUTOLOGIN_USERNAME"];

header('Location: /');

?>
