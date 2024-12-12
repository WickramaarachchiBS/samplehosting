<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 11/12/2024
  Time: 8:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- title -->
    <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
    <title>Movie|Land - Seat Booking</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Geist+Mono:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
        * {
            margin: 0;
            font-family:  Geist Mono;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background: #000000;
            color: #fff;
            line-height: 1.6;
            padding: 15px;
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
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        /* Selected Movie Section */
        .selected-movie {
            background-color: #011621;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 15px;
            text-align: center;
            box-shadow: 0 0 10px rgba(234, 134, 26, 0.65);
        }
        .selected-movie h2 {
            font-size: 1.5rem;
            margin-bottom: 5px;
        }
        .selected-movie p {
            font-size: 1rem;
        }
        /* Timer */
        .timer-container {
            text-align: right;
            margin-bottom: 5px;
        }
        #timer {
            font-size: 1.5rem;
            font-weight: bold;
            color: #fff;
        }
        /* Screen */
        .screen {
            background-color: #ffffff;
            color: #000000;
            text-align: center;
            font-size: 1rem;
            width: 70%;
            height: 2px;
            max-width: 600px;
            margin: 0 auto 0 auto;
            border-radius: 5px;
            /* transform: rotateX(-45deg); */
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
        }
        .alleyes {
            text-align: center;
            font-size: small;
        }
        /* Theatre and Seats */
        .theatre {
            overflow-x: auto;
            width: 100%;
            padding-bottom: 20px;
        }
        .theatre-wrapper {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            min-width: 1000px; /* Ensures the full seat layout is visible */
        }
        .cinema-seats {
            display: flex;
            flex-direction: row;
            align-items: center;
            margin: 0 10px;
        }
        .cinema-col {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin: 0 5px 0 5px;
        }
        .seat {
            width: 30px;
            height: 38px;
            color: #000000;
            text-align: center;
            font-size: small;
            background: #ffaf04;
            border-radius: 7px;
            cursor: pointer;
            transition: background-color 0.3s;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
            /* transform: rotateX(-10deg);
            transform: rotateY(-5deg); */
        }
        .seat:hover {
            background-color: #c4c4c4;
        }
        .seat.active {
            background-color: white;
        }
        /* Seat Legend */
        .seat-info {
            margin: 20px 0;
        }
        .seatLegend .legends {
            display: flex;
            justify-content: center;
            list-style-type: none;
            gap: 20px;
            padding: 0;
        }
        .seatLegend .legends li {
            display: flex;
            align-items: center;
        }
        .seatLegend .legends li::before {
            content: '';
            display: inline-block;
            width: 20px;
            height: 20px;
            margin-right: 8px;
            border-radius: 4px;
        }
        .seatLegend .legends .selected::before {
            background-color: white;
        }
        .seatLegend .legends .available::before {
            background-color: #ffaf04;
        }
        .seatLegend .legends .reserved::before {
            background-color: rgb(66, 66, 66);
        }
        .text {
            font-size: 0.875rem;
            color: #f4ecec;
        }
        /* Ticket Selection */
        .ticket-selection {
            background: rgba(68, 65, 65, 0.881);
            padding: 20px;
            border-radius: 10px;
            max-width: 700px;
            margin: 20px auto;
            text-align: center;
        }
        .ticket-type {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .ticket-type div {
            display: flex;
            justify-content: space-between;
        }
        /* Navigation */
        .navigation {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }
        .navigation button {
            background-color: #fff;
            color: black;
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 10px rgb(102, 102, 102);
            padding: 6px 10px;
            cursor: pointer;
            font-size: 1.5rem;
            font-weight: bold;
            transition: transform 0.3s ease
        }
        .navigation button:hover {
            transform: scale(1.05);
            background-color: rgb(197, 197, 197);
        }
        /* Horizontal Scroll Styling for Mobile */
        @media screen and (max-width: 768px) {
            .theatre {
                /* Hide scrollbar for Chrome, Safari and Opera */
                ::-webkit-scrollbar {
                    display: none;
                }
                -ms-overflow-style: none;  /* IE and Edge */
                scrollbar-width: none;  /* Firefox */
            }
            .theatre-wrapper {
                min-width: 1000px;
            }
        }
        /* Additional Responsive Tweaks */
        @media screen and (max-width: 480px) {
            .selected-movie h2 {
                font-size: 1.2rem;
            }
            .selected-movie p {
                font-size: 0.875rem;
            }
            .navigation button {
                font-size: 1.2rem;
                padding: 8px 15px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="selected-movie">
            <h2 id="movie-name">${movie.title}</h2>
            <p id="movie-details">${sessionScope.selectedDate}, ${sessionScope.selectedTime}</p>
        </div>

        <div class="timer-container">
            <div id="timer">05:00</div>
        </div>

        <div class="screen"></div>
        <div class="alleyes">SCREEN THIS WAY</div>

        <div class="theatre">
            <div class="theatre-wrapper">
                <div class="cinema-seats left">

                    <div class="cinema-col col-1">
                        <div class="seat"><div class="sn">A1</div></div>
                        <div class="seat"><div class="sn">B1</div></div>
                        <div class="seat"><div class="sn">C1</div></div>
                        <div class="seat"><div class="sn">D1</div></div>
                        <div class="seat"><div class="sn">E1</div></div>
                    </div>
                    <div class="cinema-col col-2">
                        <div class="seat"><div class="sn">A2</div></div>
                        <div class="seat"><div class="sn">B2</div></div>
                        <div class="seat"><div class="sn">C2</div></div>
                        <div class="seat"><div class="sn">D2</div></div>
                        <div class="seat"><div class="sn">E2</div></div>
                    </div>
                    <div class="cinema-col col-3">
                        <div class="seat"><div class="sn">A3</div></div>
                        <div class="seat"><div class="sn">B3</div></div>
                        <div class="seat"><div class="sn">C3</div></div>
                        <div class="seat"><div class="sn">D3</div></div>
                        <div class="seat"><div class="sn">E3</div></div>
                    </div>
                </div>

                <div class="cinema-seats middle">

                    <div class="cinema-col col-1">
                        <div class="seat"><div class="sn">A4</div></div>
                        <div class="seat"><div class="sn">B4</div></div>
                        <div class="seat"><div class="sn">C4</div></div>
                        <div class="seat"><div class="sn">D4</div></div>
                        <div class="seat"><div class="sn">E4</div></div>
                    </div>
                    <div class="cinema-col col-2">
                        <div class="seat"><div class="sn">A5</div></div>
                        <div class="seat"><div class="sn">B5</div></div>
                        <div class="seat"><div class="sn">C5</div></div>
                        <div class="seat"><div class="sn">D5</div></div>
                        <div class="seat"><div class="sn">E5</div></div>
                    </div>
                    <div class="cinema-col col-3">
                        <div class="seat"><div class="sn">A6</div></div>
                        <div class="seat"><div class="sn">B6</div></div>
                        <div class="seat"><div class="sn">C6</div></div>
                        <div class="seat"><div class="sn">D6</div></div>
                        <div class="seat"><div class="sn">E6</div></div>
                    </div>
                    <div class="cinema-col col-4">
                        <div class="seat"><div class="sn">A7</div></div>
                        <div class="seat"><div class="sn">B7</div></div>
                        <div class="seat"><div class="sn">C7</div></div>
                        <div class="seat"><div class="sn">D7</div></div>
                        <div class="seat"><div class="sn">E7</div></div>
                    </div>
                    <div class="cinema-col col-5">
                        <div class="seat"><div class="sn">A8</div></div>
                        <div class="seat"><div class="sn">B8</div></div>
                        <div class="seat"><div class="sn">C8</div></div>
                        <div class="seat"><div class="sn">D8</div></div>
                        <div class="seat"><div class="sn">E8</div></div>
                    </div>
                    <div class="cinema-col col-5">
                        <div class="seat"><div class="sn">A9</div></div>
                        <div class="seat"><div class="sn">B9</div></div>
                        <div class="seat"><div class="sn">C9</div></div>
                        <div class="seat"><div class="sn">D9</div></div>
                        <div class="seat"><div class="sn">E9</div></div>
                    </div>
                </div>

                <div class="cinema-seats right">

                    <div class="cinema-col col-1">
                        <div class="seat"><div class="sn">A10</div></div>
                        <div class="seat"><div class="sn">B10</div></div>
                        <div class="seat"><div class="sn">C10</div></div>
                        <div class="seat"><div class="sn">D10</div></div>
                        <div class="seat"><div class="sn">E10</div></div>
                    </div>
                    <div class="cinema-col col-2">
                        <div class="seat"><div class="sn">A11</div></div>
                        <div class="seat"><div class="sn">B11</div></div>
                        <div class="seat"><div class="sn">C11</div></div>
                        <div class="seat"><div class="sn">D11</div></div>
                        <div class="seat"><div class="sn">E11</div></div>
                    </div>
                    <div class="cinema-col col-3">
                        <div class="seat"><div class="sn">A12</div></div>
                        <div class="seat"><div class="sn">B12</div></div>
                        <div class="seat"><div class="sn">C12</div></div>
                        <div class="seat"><div class="sn">D12</div></div>
                        <div class="seat"><div class="sn">E12</div></div>
                    </div>

                </div>
            </div>
        </div>


        <!-- seat info -->
        <div class="seat-info">
            <div class="seatLegend">
                <ul class="legends">
                    <li class="selected"><span class="text">Selected</span></li>
                    <li class="available"><span class="text">Available</span></li>
                    <li class="reserved"><span class="text">Reserved</span></li>
                </ul>
            </div>
        </div>

        <div class="ticket-selection">
            <div class="ticket-type">
                <div>
                    <span>Seats Selected:</span>
                    <span id="selected-seats">0</span>
                </div>
                <div>
                    <span>Total Price:</span>
                    <span id="total-price">0.00</span>
                </div>
            </div>
            <br>
            <div class="price" style="text-align: left;">
                (LKR 700.00 per person)
            </div>
        </div>


        <div class="navigation">
            <form id="seatForm" action="payment2.jsp" method="POST">
                <input type="hidden" name="selectedSeats" is="selectedSeatsInput">
                <button type="submit" class="next-page">Proceed to Payment</button>
            </form>
        </div>

    </div>
    <%--            <button class="prev-page"><a href="timetable.jsp" style="text-decoration: none">&#8678;</a></button>--%>
    <%--            <button class="next-page"><a href="payment2.jsp" style="text-decoration: none">&#8680;</a></button>--%>


    <!-- scripts -->
    <script>

        // Timer functionality
        const timerDuration = 300;  //seconds
        let remainingTime = timerDuration;
        const timerElement = document.getElementById("timer");

        function formatTime(seconds) {
            const minutes = Math.floor(seconds / 60);
            const secs = seconds % 60;
            return `${minutes.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
        }

        function startCountdown() {
            const interval = setInterval(() => {
                if (remainingTime <= 0) {
                    clearInterval(interval);
                    timerElement.textContent = "Time's Up!";
                } else {
                    remainingTime -= 1;
                    timerElement.textContent = formatTime(remainingTime);
                }
            }, 1000);
        }
        timerElement.textContent = formatTime(remainingTime);
        startCountdown();


        // Seat Selection Logic
        const seats = document.querySelectorAll('.cinema-seats .seat');
        const selectedSeatsElement = document.getElementById('selected-seats');
        const totalPriceElement = document.getElementById('total-price');
        const prevPageButton = document.querySelector(".prev-page");
        const nextPageButton = document.querySelector('.next-page');
        const seatForm = document.getElementById('seatForm');
        const selectedSeatsInput = document.getElementById('selectedSeatsInput');

        seatForm.addEventListener('submit', () => {
            selectedSeatsInput.value = selectedSeats.join(',');
        });

        let selectedSeats = [];
        const seatPrice = 700.00;

        seats.forEach((seat, index) => {
            seat.addEventListener('click', () => {
                seat.classList.toggle('active');
                if (seat.classList.contains('active')) {
                    selectedSeats.push(index + 1);
                } else {
                    selectedSeats = selectedSeats.filter(s => s !== index + 1);
                }
                updateSelectedSeatsAndPrice();
            });
        });

        function updateSelectedSeatsAndPrice() {
            selectedSeatsElement.textContent = selectedSeats.length;
            totalPriceElement.textContent = (selectedSeats.length * seatPrice).toFixed(2);
        }
    </script>


</body>
</html>
