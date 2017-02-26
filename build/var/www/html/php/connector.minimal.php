<?php

error_reporting(0); // Set E_ALL for debuging

// elFinder autoload
require './autoload.php';
// ===============================================

/**
 * Simple function to demonstrate how to control file access using "accessControl" callback.
 * This method will disable accessing files/folders starting from '.' (dot)
 *
 * @param  string  $attr  attribute name (read|write|locked|hidden)
 * @param  string  $path  file path relative to volume root directory started with directory separator
 * @return bool|null
 **/
function access($attr, $path, $data, $volume) {
        return strpos(basename($path), '.') === 0       // if file/folder begins with '.' (dot)
                ? !($attr == 'read' || $attr == 'write')    // set read+write to false, other (locked+hidden) set to true
                :  null;                                    // else elFinder decide it itself
}


// Documentation for connector options:
// https://github.com/Studio-42/elFinder/wiki/Connector-configuration-options

// check if we overwrite the PATH and the URL parameter with an env variable
// usefull for reverse proxy setups
$FILES_PATH = getenv("ELFINDER_FILES_PATH");
if (empty($FILES_PATH)) {
        $FILES_PATH = '../files/';
}
$FILES_URI = getenv("ELFINDER_FILES_URI");
if (empty($FILES_URI)) {
        $basedir  = dirname($_SERVER['PHP_SELF']);
        $FILES_URI = $basedir . "/" . $FILES_PATH;
}

$opts = array(
        // 'debug' => true,
        'roots' => array(
                array(
                        'driver'        => 'LocalFileSystem',
                        'path'          => $FILES_PATH,
                        'URL'           => $FILES_URI,
                        'uploadDeny'    => array('all'),
                        'accessControl' => 'access',
                )
        )
);

// run elFinder
$connector = new elFinderConnector(new elFinder($opts));
$connector->run();
