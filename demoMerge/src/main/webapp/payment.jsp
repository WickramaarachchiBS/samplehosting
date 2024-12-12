<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- title -->
    <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
    <title>Cinema Payment System</title>
    <!-- CSS -->
    <style>
        *{
            font-family: 'Poppins', sans-serif;
            margin:0; padding:0;
            box-sizing: border-box;
            outline: 1px; border:1px;
            transition: all .2s linear;
        }
        body {
            opacity: 0;
            animation: fadeIn 1s ease-in-out forwards;
        }
        @keyframes fadeIn{
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        .container{
            display: flex;
            justify-content: center;
            align-items: center;
            padding:25px;
            min-height: 100vh;
            background: #F0F4FA;
        }
        .container form{
            padding:20px;
            width:700px;
            background: #fff;
            box-shadow: 0 5px 10px rgba(0,0,0,.1);
        }
        .container form .row{
            display: flex;
            flex-wrap: wrap;
            gap:15px;
        }
        .container form .row .col{
            flex:1 1 250px;
        }
        .container form .row .col .inputBox{
            margin:15px 0;
        }
        .container form .row .col .inputBox span{
            margin-bottom: 10px;
            display: block;
        }
        .container form .row .col .inputBox input{
            width: 100%;
            border:1px solid #ccc;
            padding:10px 15px;
            font-size: 15px;
            text-transform: none;
        }
        .container form .row .col .inputBox input:focus{
            border:1px solid #000;
        }
        .container form .row .col .flex{
            display: flex;
            gap:15px;
        }
        .container form .row .col .flex .inputBox{
            margin-top: 5px;
        }
        .container form .row .col .inputBox img{
            height: 34px;
            margin-top: 5px;
            filter: drop-shadow(0 0 1px #000);
        }
        .container form .submit-btn{
            width: 100%;
            padding:12px;
            font-size: 17px;
            background: #007BFF;
            color:#fff;
            margin-top: 5px;
            cursor: pointer;
        }
        .container form .submit-btn:hover{
            background-color: #007BFF;
            color: #FFFFFF;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="container">
    <form action="paymentServlet">
        <div class="row">
            <div class="col">
                <h3 class="title">PAYMENT</h3>

                <div class="inputBox">
                    <span>Cards Accepted :</span>
                    <img src="Assets/paymentImages/card_img.png" alt=""/>
                </div>
                <div class="inputBox">
                    <span>Name On Card :</span>
                    <input type="text" placeholder="Mr.Matthew Williams" required>
                </div>
                <div class="inputBox">
                    <span>Credit Card Number :</span>
                    <input type="number" placeholder="1111-2222-3333-4444" required>
                </div>
                <div class="inputBox">
                    <span>Exp Month :</span>
                    <input type="text" placeholder="January" required>
                </div>
                <div class="flex">
                    <div class="inputBox">
                        <span>Exp Year :</span>
                        <input type="number" placeholder="2024" required>
                    </div>
                    <div class="inputBox">
                        <span>CVV :</span>
                        <input type="text" placeholder="1234" required>
                    </div>
                </div>
            </div>
        </div>

        <input type="submit" value="Pay Now" class="submit-btn">

    </form>

</div>

</body>
</html>
