<?php
    session_start();
    $match = false;

    // Read Data From Form
    if (isset($_POST['username']) && isset($_POST['password'])) {
        $form_username = $_POST['username'];
        $form_password = $_POST['password'];
    }
    // Verify UserName and Filter customer Category
    try {
        $file = fopen("account.db", "r") or die("Unable to open file!");
        $integrity = true; 
        if ($file) {
            $type = $username = $password = '';
            while(!feof($file) && !$match) {
                $line = fgets($file);
                for ($i = 1; $i < 4; $i++) {
                    // echo "Line: " . $line . '<br>';
                    $pos = strpos($line, '|');
                    $sub_str = substr($line, 0, $pos);
                    $line = substr($line, $pos + 1, strlen($line) - 1);
                    switch ($i) {
                        case 1: 
                            $type = $sub_str;
                            break;
                        case 2: 
                            $username = $sub_str;
                            break;
                        case 3: 
                            $password = $sub_str;
                            break;
                    }
                }
                if ($username == $form_username && $form_password == $password) {
                    $match = true;
                    break;
                }
            }
            fclose($file);    
            // Direct to My Account Page
            if ($match) {
                $_SESSION['username'] = $_POST['username'];
                $_SESSION['password'] = $_POST['password'];
                $_SESSION['loggedin'] = true;
                if ($type == 'admin') {
                    header("Location: /app/src/html/admin-dashboard.html");
                }
                if ($type == 'teacher') {
                    header("Location: /app/src//html/TeacherDashBoard.html");
                }
            }
            else {
                echo "<script> 
                location.href = '/app/src/index.html';
                alert('Wrong account/password! Please enter again!');
                </script>";        
                die("");        
            }
        } 
    }
    catch (Throwable $th) {
        throw $th;
    }

?>