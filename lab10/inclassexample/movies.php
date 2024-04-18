<?php
include('includes/init.inc.php');
include('includes/functions.inc.php');
ini_set('display_errors', 1);
error_reporting(E_ALL);

include('includes/head.inc.php');
?>

<h1>PHP &amp; MySQL</h1>

<?php include('includes/menubody.inc.php'); ?>

<h3>Movies</h3>
<table id="moviesTable">
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

    if ($dbOk) {
        // Query movies table and display results
        $query = 'SELECT * FROM movies ORDER BY title';
        $result = $db->query($query);
        $numRecords = $result->num_rows;

        if ($numRecords > 0) {
            echo '<tr><th>Title:</th><th>Year:</th><th></th></tr>';
            for ($i = 0; $i < $numRecords; $i++) {
                $record = $result->fetch_assoc();
                if ($i % 2 == 0) {
                    echo "\n" . '<tr id="movie-' . $record['movieid'] . '"><td>';
                } else {
                    echo "\n" . '<tr class="odd" id="movie-' . $record['movieid'] . '"><td>';
                }
                echo htmlspecialchars($record['title']) . ', ';
                echo '</td><td>';
                echo htmlspecialchars($record['year']);
                echo '</td><td>';
                echo '<img src="resources/delete.png" class="deleteMovie" width="16" height="16" alt="delete movie"/>';
                echo '</td></tr>';
            }
        } else {
            echo '<tr><td colspan="3">No movies found</td></tr>';
        }

        $result->free();
        $db->close();
    }
    ?>
</table>

<?php include('includes/foot.inc.php'); ?>
