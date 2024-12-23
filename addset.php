<?php
include 'db.php'; // รวมไฟล์เชื่อมต่อฐานข้อมูล
session_start(); // เริ่มต้น session

// ตรวจสอบว่า user_id ถูกตั้งค่าหรือยัง (ผู้ใช้ล็อกอินหรือไม่)
if (!isset($_SESSION['user_id'])) {
    // ถ้าไม่ได้ล็อกอิน ส่งผู้ใช้ไปที่หน้า login
    header('Location: login.php');
    exit;
}

// ฟังก์ชันสำหรับบันทึก Log
function logAction($action, $details, $conn) {
    $created_by = $_SESSION['user_name'] ?? 'Guest'; // ใช้ชื่อผู้ใช้ที่ล็อกอิน หรือ Guest หากไม่ได้ล็อกอิน
    $stmt = $conn->prepare("INSERT INTO logs (action, details, created_by) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $action, $details, $created_by);
    $stmt->execute();
    $stmt->close();
}

// Initialize variables
$set_name = $set_price = $sale_price = $set_image = "";
$set_name_err = $set_price_err = $sale_price_err = $set_image_err = "";

// เมื่อมีการ submit ฟอร์ม
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate set_name
    if (empty(trim($_POST["set_name"]))) {
        $set_name_err = "Please enter the set name.";
    } else {
        $set_name = trim($_POST["set_name"]);
    }

    // Validate set_price
    if (empty(trim($_POST["set_price"]))) {
        $set_price_err = "Please enter the set price.";
    } else {
        $set_price = trim($_POST["set_price"]);
    }

    // Validate sale_price
    if (empty(trim($_POST["sale_price"]))) {
        $sale_price_err = "Please enter the sale price.";
    } else {
        $sale_price = trim($_POST["sale_price"]);
    }

    // Handle image upload (optional)
    if (isset($_FILES['set_image']) && $_FILES['set_image']['error'] == 0) {
        $image_tmp = $_FILES['set_image']['tmp_name'];
        $image_name = $_FILES['set_image']['name'];
        $target_dir = "C:/xampp/htdocs/project/sets/"; // Change to your desired folder
        $target_file = $target_dir . basename($image_name);
        $image_file_type = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        $allowed_types = ["jpg", "jpeg", "png", "gif"];

        if (!in_array($image_file_type, $allowed_types)) {
            $set_image_err = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        } else {
            if (move_uploaded_file($image_tmp, $target_file)) {
                $set_image = $image_name;
            } else {
                $set_image_err = "Sorry, there was an error uploading your image.";
            }
        }
    } // No else required for skipping image validation

    // If no errors, insert into database
    if (empty($set_name_err) && empty($set_price_err) && empty($sale_price_err) && empty($set_image_err)) {
        // ตรวจสอบ discount จากฟอร์ม
        if (isset($_POST['discount']) && is_numeric($_POST['discount'])) {
            $discount = trim($_POST['discount']);
        } else {
            $discount = 0;
        }

        // กำหนดค่า created_by
        $created_by = $_SESSION['user_name'] ?? 'Guest';

        // เพิ่มข้อมูลในฐานข้อมูล
        $sql = "INSERT INTO sets (set_name, set_price, sale_price, discount_percentage, set_image, created_by) VALUES (?, ?, ?, ?, ?, ?)";

        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("ssddss", $set_name, $set_price, $sale_price, $discount, $set_image, $created_by);

            if ($stmt->execute()) {
                // Log the action after successful insertion
                logAction('AddSet', "Added set: $set_name with discount $discount%", $conn);

                // Get the ID of the newly inserted set
                $set_id = $stmt->insert_id;

                // Redirect to add items to the set
                header("Location: additemtoset.php?set_id=" . $set_id);
                exit();
            } else {
                echo "Error: " . $stmt->error;
            }
            $stmt->close();
        }
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>สร้าง Set</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="style.css">
    <script>
        function calculateSalePrice() {
            const setPrice = parseFloat(document.getElementById('set_price').value) || 0;
            const discount = parseFloat(document.getElementById('discount').value) || 0;
            const salePrice = setPrice - (setPrice * (discount / 100));
            document.getElementById('sale_price').value = salePrice.toFixed(2);  // Update sale price
        }
    </script>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center text-success">สร้าง Set</h2>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" enctype="multipart/form-data" class="form-group">
            <div class="mb-3">
                <label for="set_name" class="form-label">ชื่อ Set:</label>
                <input type="text" name="set_name" class="form-control" value="<?php echo $set_name; ?>">
                <span class="text-danger"><?php echo $set_name_err; ?></span>
            </div>

            <div class="mb-3">
                <label for="set_price" class="form-label">ราคา:</label>
                <input type="text" id="set_price" name="set_price" class="form-control" value="<?php echo $set_price; ?>" oninput="calculateSalePrice()">
                <span class="text-danger"><?php echo $set_price_err; ?></span>
            </div>

            <div class="mb-3">
                <label for="discount" class="form-label">เปอร์เซ็นต์ที่ลด:</label>
                <input type="text" id="discount" name="discount" class="form-control" value="0" oninput="calculateSalePrice()">
            </div>

            <div class="mb-3">
                <label for="sale_price" class="form-label">ลดเหลือ:</label>
                <input type="text" id="sale_price" name="sale_price" class="form-control" value="<?php echo $sale_price; ?>" readonly>
                <span class="text-danger"><?php echo $sale_price_err; ?></span>
            </div>

            <div class="mb-3">
                <label for="set_image" class="form-label">Set Image (Optional):</label>
                <input type="file" name="set_image" class="form-control">
                <span class="text-danger"><?php echo $set_image_err; ?></span>
            </div>

            <button type="submit" class="btn btn-success w-100">สร้าง</button>
        </form>
    </div>
</body>
</html>
