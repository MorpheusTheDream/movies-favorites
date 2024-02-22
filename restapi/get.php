<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Credentials: true");
header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
header('Access-Control-Max-Age: 1000');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token , Authorization');

define('HOST', 'localhost');
define('USER', 'root');
define('PASS', '');
define('DB', 'rest-api');

$conn = mysqli_connect(HOST, USER, PASS, DB) or die('unable Connect');

$data = json_decode(file_get_contents('php://input'), TRUE);

if (isset($data)) {
    $dataUser = new dataUser();

    if ($data["status"] == "create") {
        $dataUser->createAccount($data, $conn);
    } else if ($data["status"] == "checklogin") {
        $dataUser->checkingAccount($data, $conn);
    } else if ($data["status"] == "login") {
        $dataUser->loginAccount($data, $conn);
    } else if ($data["status"] == "favorite") {
        $dataUser->favorite($data, $conn);
    } else if ($data["status"] == "favoritelist") {
        $dataUser->favoritelist($data, $conn);
    } else if ($data["status"] == "checking") {
        $dataUser->checkingFavorite($data, $conn);
    } else if ($data["status"] == "unfavorite") {
        $dataUser->unFavorite($data, $conn);
    } else if ($data["status"] == "updateRating") {
        $dataUser->updateRating($data, $conn);
    }
}

class dataUser
{
    public function createAccount($data, $conn)
    {
        $firstName = $data["firstname"];
        $lastName = $data["lastname"];
        $username = $data["username"];
        $pass = $data["password"];
        $email = $data["email"];
        $token = $data["token"];

        mysqli_query($conn, "INSERT INTO users (firstname, lastname, username, password, email, token) VALUES ( '$firstName', '$lastName', '$username', '$pass', '$email', '$token')");
        echo "success";
    }

    public function checkingAccount($data, $conn)
    {
        $username = $data["username"];
        $pass = $data["password"];

        $query = mysqli_query($conn, "SELECT * FROM users WHERE username = '$username' AND password = '$pass'");
        $result = mysqli_fetch_assoc($query);
        if ($result == null) {
            echo "failed";
        } else {
            echo $result["token"];
        }
    }

    public function loginAccount($data, $conn)
    {
        $token = $data["token"];

        $query = mysqli_query($conn, "SELECT * FROM users WHERE token = '$token'");
        $result = mysqli_fetch_assoc($query);
        if ($result == null) {
            echo "failed";
        } else {
            echo $result["firstname"];
        }
    }

    public function favorite($data, $conn)
    {
        $token = $data["token"];
        $queryuser = mysqli_query($conn, "SELECT * FROM users WHERE token = '$token'");
        $resultquery = mysqli_fetch_row($queryuser);

        $username = $resultquery[1];;
        $poster = $data["poster"];
        $title = $data["title"];
        $year = $data["year"];
        $imdbId = $data["imdbId"];

        mysqli_query($conn, "INSERT INTO favorite (username, poster, title, year, imdbid) VALUES ( '$username', '$poster', '$title', '$year', '$imdbId')");
    }

    public function favoritelist($data, $conn)
    {
        $token = $data["token"];
        $queryuser = mysqli_query($conn, "SELECT * FROM users WHERE token = '$token'");
        $userResult = mysqli_fetch_assoc($queryuser);
        $username = $userResult["username"];
        $favoritequery = mysqli_query($conn, "SELECT * FROM favorite WHERE username = '$username'");

        $results = mysqli_fetch_all($favoritequery);

        $resultsNumber = count($results);

        $pagenumber = 0;
        $loadNumber = 0;


        while ($resultsNumber > 14) {
            $arrayIsiJson = array();
            for ($i = 0; $i < 14; $i++) {
                $arrayIsiJson[$i] = array(
                    "no" => $loadNumber,
                    "title" => $results[$loadNumber][3],
                    "poster" => $results[$loadNumber][2],
                    "year" => $results[$loadNumber][4],
                    "imdbid" => $results[$loadNumber][5],
                    "userrating" => $results[$loadNumber][6]
                );
                $loadNumber += 1;
            };
            $arrayJson[$pagenumber] = $arrayIsiJson;
            $pagenumber += 1;
            $resultsNumber -= 14;
        };

        if ($resultsNumber <= 14) {
            $arrayIsiJson = array();
            for ($i = 0; $i < $resultsNumber; $i++) {
                $arrayIsiJson[$i] = array(
                    "no" => $loadNumber,
                    "title" => $results[$loadNumber][3],
                    "poster" => $results[$loadNumber][2],
                    "year" => $results[$loadNumber][4],
                    "imdbid" => $results[$loadNumber][5],
                    "userrating" => $results[$loadNumber][6]
                );
                $loadNumber += 1;
            };

            $arrayJson[$pagenumber] = $arrayIsiJson;
        };

        $json = json_encode($arrayJson);
        echo $json;
    }

    public function unFavorite($data, $conn)
    {
        $imdbId = $data["imdbId"];
        mysqli_query($conn, "DELETE FROM favorite WHERE imdbid = '$imdbId'");
    }

    public function checkingFavorite($data, $conn)
    {
        $token = $data["token"];
        $imdid = $data["imdbid"];

        $userquery = mysqli_query($conn, "SELECT * FROM users WHERE token = '$token' ");
        $userResult = mysqli_fetch_assoc($userquery);
        $user = $userResult["username"];

        $query = mysqli_query($conn, "SELECT * FROM favorite WHERE imdbid = '$imdid' AND username = '$user'");
        $result = mysqli_fetch_assoc($query);

        if ($result == null) {
            echo "no";
        } else {
            echo json_encode($result);
        };
    }

    public function updateRating($data, $conn)
    {
        $userRating = $data["rating"];
        $imdbId = $data["imdbId"];
        mysqli_query($conn, "UPDATE favorite SET userrating = '$userRating' WHERE imdbid = '$imdbId'");
    }
}
