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

// Process form submission
$havePost = isset($_POST["save"]);
$errors = '';
if ($havePost) {
    // Form validation and insertion logic
    $title = htmlspecialchars(trim($_POST["title"]));
    $year = htmlspecialchars(trim($_POST["year"]));

    if ($title == '') {
        $errors .= '<li>Title may not be blank</li>';
    }
    if ($year == '') {
        $errors .= '<li>Year may not be blank</li>';
    }

    if ($errors != '') {
        echo '<div class="messages"><h4>Please correct the following errors:</h4><ul>';
        echo $errors;
        echo '</ul></div>';
        echo '</ul></div>';
        echo '<script type="text/javascript">';
        echo '  $(document).ready(function() {';
        echo '    $("' . $focusId . '").focus();';
        echo '  });';
        echo '</script>';
    } else {
        if ($dbOk) {
            $titleForDb = trim($_POST["title"]);
            $yearForDb = trim($_POST["year"]);

            $insQuery = "INSERT INTO movies (`title`, `year`) VALUES (?, ?)";
            $statement = $db->prepare($insQuery);
            $statement->bind_param("ss", $titleForDb, $yearForDb);
            $statement->execute();

            echo '<div class="messages"><h4>Success: ' . $statement->affected_rows . ' movie added to database.</h4>';
            echo $title . ', released in ' . $year . '</div>';

            $statement->close();
        }
    }
}
?>

<h3>Add Movie</h3>
<form id="addForm" name="addForm" action="movies.php" method="post" onsubmit="return validate(this);">
    <fieldset>
        <div class="formData">
            <label class="field" for="title">Title:</label>
            <div class="value"><input type="text" size="60" value="<?php if ($havePost && $errors != '') { echo $title; } ?>" name="title" id="title" /></div>

            <label class="field" for="year">Year:</label>
            <div class="value"><input type="text" size="10" maxlength="4" value="<?php if ($havePost && $errors != '') { echo $year; } ?>" name="year" id="year" /></div>

            <input type="submit" value="Save" id="save" name="save" />
        </div>
    </fieldset>
</form>

<h3>Movies</h3>
<table id="moviesTable">
    <?php
    if ($dbOk) {
        $query = 'SELECT * FROM movies ORDER BY title';
        $result = $db->query($query);
        $numRecords = $result->num_rows;
        echo '<tr><th>Title:</th><th>Year:</th></tr>';
        for ($i = 0; $i < $numRecords; $i++) {
            $record = $result->fetch_assoc();
            if ($i % 2 == 0) {
                echo "\n" . '<tr id="movie-' . $record['movieid'] . '"><td>';
            } else {
                echo "\n" . '<tr class="odd" id="movie-' . $record['movieid'] . '"><td>';
            }
            echo htmlspecialchars($record['title']);
            echo '</td><td>';
            echo htmlspecialchars($record['year']);
            echo '</td></td>';
            echo '<img src="resources/delete.png" class="deleteMovie" width="16" height="16" alt="delete movie"/>';
            echo '</td></tr>';
        }
        $result->free();

        // Finally, let's close the database
        $db->close();
    }
    ?>
</table>

<?php include('includes/foot.inc.php'); ?>
