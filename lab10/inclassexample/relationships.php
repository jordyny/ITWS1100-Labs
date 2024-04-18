<?php
include('includes/init.inc.php');
include('includes/functions.inc.php');
ini_set('display_errors', 1);
error_reporting(E_ALL);

include('includes/head.inc.php');
?>

<h1>PHP &amp; MySQL</h1>

<?php include('includes/menubody.inc.php'); ?>

<?php
// Database connection
$dbOk = false;
@$db = new mysqli('localhost', 'root', 'j0000rdyn!', 'iit');

if ($db->connect_error) {
    echo '<div class="messages">Could not connect to the database. Error: ';
    echo $db->connect_errno . ' - ' . $db->connect_error . '</div>';
} else {
    $dbOk = true;
}

// Display movies and their corresponding actors
echo '<h3>Movies and Corresponding Actors</h3>';
echo '<table id="relationshipsTable">';
if ($dbOk) {
    $query = 'SELECT * FROM actor_movie_relationship';
    $result = $db->query($query);
    $numRecords = $result->num_rows;
    echo '<tr><th>Movie:</th><th>Actor:</th></tr>';
    for ($i = 0; $i < $numRecords; $i++) {
        $record = $result->fetch_assoc();
        if ($i % 2 == 0) {
            echo "\n" . '<tr id="title-' . $record['title'] . '"><td>';
        } else {
            echo "\n" . '<tr class="odd" id="title-' . $record['title'] . '"><td>';
        }
        echo htmlspecialchars($record['title']);
        echo '</td><td>';
        echo htmlspecialchars($record['full_name']);
        echo '</td></tr>';
    }
    // while ($record = $result->fetch_assoc()) {
    //     echo '<tr><td>';
    //     echo htmlspecialchars($record['title']);
    //     echo '</td><td>';
    //     echo htmlspecialchars($record['full_name']);
    //     echo '</td></tr>';
    // }
    $result->free();

    // Finally, let's close the database
    $db->close();
}
echo '</table>';
?>

<?php include('includes/foot.inc.php'); ?>
