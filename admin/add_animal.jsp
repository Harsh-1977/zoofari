<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Service | ZooSafari</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #2EB872, #ffffff);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-container {
            background: #ffffff;
            width: 400px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .form-container h2 {
            text-align: center;
            color: rgb(72, 68, 68);
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
            color: #333;
        }

        .form-group input[type="text"],
        .form-group input[type="file"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #c8e6c9;
            border-radius: 6px;
            font-size: 14px;
        }

        .form-group input:focus {
            outline: none;
            border-color: #2e7d32;
        }

        .submit-btn {
            width: 100%;
            background: #2e7d32;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .submit-btn:hover {
            background: #1b5e20;
        }

        .note {
            text-align: center;
            margin-top: 10px;
            font-size: 12px;
            color: #666;
        }
    </style>
</head>

<body>

    <div class="form-container">
        <h2>Add Animals</h2>

        <form action="add_animal_process.jsp" method="post" enctype="multipart/form-data">

            <div class="form-group">
                <label>Image</label>
                <input type="file" name="image" accept="image/*" required>
            </div>

            <div class="form-group">
                <label>Animal Type</label>
                <input type="text" name="animal_type" placeholder="Enter Animal Type" required>
            </div>

            <div class="form-group">
                <label>Animal Name</label>
                <input type="text" name="animal_name" placeholder="Enter Animal Name" required>
            </div>

            <input type="submit" value="Add Animal" class="submit-btn">
        </form>

        <div class="note">Zoofari Admin Panel</div>
    </div>

</body>
</html>
