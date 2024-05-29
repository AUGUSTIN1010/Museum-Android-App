<?php
$servername = "sql.freedb.tech";
$username = "freedb_august";
$password = "sNpXDgcBF3NZ*5X";
$dbname = "freedb_proiecT_java";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM muzee";
$result = $conn->query($sql);

$data = array();

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    // echo "id: " . $row["id"]. " - Name: " . $row["nume_muzeu"]. ", Oras: " . $row["oras"]. "<br>";
    $data[] = $row;
  }
} else {
  echo "0 results";
}
$conn->close();

header('Content-type: application/json');
echo(json_encode($data))
?>