<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- title -->
    <link rel="icon" type="image/x-icon" href="Assets/letter-m.png">
    <title>Movie Land</title>
    <!-- font awesome cdn link -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- CSS link -->
    <link rel="stylesheet" href="CSS/style.css">
    <style>

    </style>
</head>
<body>
<!-- navbar -->
<jsp:include page="navbar.jsp" />

<!-- carousal -->
<div class="carousel">
    <div class="list">
            <div class="item" style="background-image: url(Assets/homepageImages/iron.jpg);">
                <div class="content">
                    <div class="title">Welcome to Movie|Land</div>
                    <div class="name">Explore the World of Cinema</div>
                    <div class="des">Discover the latest hits, timeless classics, and everything in between. Your movie journey starts here!</div>
                    <div class="btn">
                        <button class="book-now-btn" style="background-color: white"><a style="background-color: transparent; text-decoration: none; color: black; font-weight: normal" href="RetrieveAllMovieServlet">See More</a></button>
                    </div>
                </div>
            </div>

        <div class="item" style="background-image: url(Assets/homepageImages/wildrobot.jpg);">
            <div class="content">
                <div class="title">Welcome to Movie|Land</div>
                <div class="name">Explore the World of Cinema</div>
                <div class="des">Discover the latest hits, timeless classics, and everything in between. Your movie journey starts here!</div>
                <div class="btn">
                    <button class="book-now-btn" style="background-color: white"><a style="background-color: transparent; text-decoration: none; color: black; font-weight: normal" href="RetrieveAllMovieServlet">See More</a></button>

                </div>
            </div>
        </div>

        <div class="item" style="background-image: url(Assets/homepageImages/deadpool1.jpg);">
            <div class="content">
                <div class="title">Welcome to Movie|Land</div>
                <div class="name">Explore the World of Cinema</div>
                <div class="des">Discover the latest hits, timeless classics, and everything in between. Your movie journey starts here!</div>
                <div class="btn">
                    <button class="book-now-btn" style="background-color: white"><a style="background-color: transparent; text-decoration: none; color: black; font-weight: normal" href="RetrieveAllMovieServlet">See More</a></button>

                </div>
            </div>
        </div>

        <div class="item" style="background-image: url(Assets/homepageImages/fall_guy.jpeg);">
            <div class="content">
                <div class="title">Welcome to Movie|Land</div>
                <div class="name">Explore the World of Cinema</div>
                <div class="des">Discover the latest hits, timeless classics, and everything in between. Your movie journey starts here!</div>
                <div class="btn">
                    <button class="book-now-btn" style="background-color: white"><a style="background-color: transparent; text-decoration: none; color: black; font-weight: normal" href="RetrieveAllMovieServlet">See More</a></button>

                </div>
            </div>
        </div>

        <div class="item" style="background-image: url(Assets/homepageImages/image3.jpg);">
            <div class="content">
                <div class="title">Welcome to Movie|Land</div>
                <div class="name">Explore the World of Cinema</div>
                <div class="des">Discover the latest hits, timeless classics, and everything in between. Your movie journey starts here!</div>
                <div class="btn">
                    <button class="book-now-btn" style="background-color: white"><a style="background-color: transparent; text-decoration: none; color: black; font-weight: normal" href="RetrieveAllMovieServlet">See More</a></button>

                </div>
            </div>
        </div>

    </div>

    <!--next prev button-->
    <div class="arrows">
        <button class="prev"><</button>
        <button class="next">></button>
    </div>

    <!-- time running -->
    <div class="timeRunning"></div>
</div>
<!-- /carousal -->

<!-- latest movies -->
<section class="latest-movies" style="background-color: black;">
    <h2>Latest Movies</h2>
    <div class="movie-cards-container">
        <!-- Card 1 -->
        <div class="movie-card">
            <img src="Assets/homepageImages/gladiator_2.jpg" alt="Movie 1">
            <div class="movie-details">
                <h3>Gladiator II</h3>
                <p>Years after witnessing the death of Maximus at the hands of his uncle, Lucius must enter the Colosseum..</p>
                <button class="book-now-btn"><a style="background-color: transparent; text-decoration: none; color: white;" href="RetrieveAllMovieServlet">Book Now</a></button>
            </div>
        </div>

        <!-- Card 2 -->
        <div class="movie-card">
            <img src="Assets/homepageImages/red_one.jpg" alt="Movie 2">
            <div class="movie-details">
                <h3>Red One</h3>
                <p>When a villain kidnaps Santa Claus from the North Pole, an E.L.F. (Extremely Large and Formidable) operative..</p>
                <button class="book-now-btn"><a style="background-color: transparent; text-decoration: none; color: white;" href="RetrieveAllMovieServlet">Book Now</a></button>
            </div>
        </div>

        <!-- Card 3 -->
        <div class="movie-card">
            <img src="Assets/homepageImages/amaran_2.jpg" alt="Movie 3">
            <div class="movie-details">
                <h3>Amaran</h3>
                <p>A true-life story of Major Mukund Varadarajan, a commissioned officer in the Indian Army..</p>
                <button class="book-now-btn"><a style="background-color: transparent; text-decoration: none; color: white;" href="RetrieveAllMovieServlet">Book Now</a></button>
            </div>
        </div>

        <!-- Card 4 -->
        <div class="movie-card">
            <img src="Assets/homepageImages/wicked.jpg" alt="Movie 4">
            <div class="movie-details">
                <h3>Wicked</h3>
                <p>Misunderstood because of her green skin, a young woman named Elphaba..</p>
                <button class="book-now-btn"><a style="background-color: transparent; text-decoration: none; color: white;" href="RetrieveAllMovieServlet">Book Now</a></button>
            </div>
        </div>
    </div>
</section>

<!-- upcoming movies -->
<section class="latest-movies" style="background-color: black">
    <h2>Upcoming Movies</h2>
    <div class="movie-cards-container">
        <!-- Card 1 -->
        <div class="movie-card">
            <img src="Assets/homepageImages/avatar.jpg" alt="Movie 1">
            <div class="movie-details">
                <h3>Avatar: Fire and Ash</h3>
                <p>An upcoming American epic science fiction film a sequel to Avatar franchise.</p>
            </div>
        </div>

        <!-- Card 2 -->
        <div class="movie-card">
            <img src="Assets/homepageImages/f1.jpg" alt="Movie 2">
            <div class="movie-details">
                <h3>F1-The Movie</h3>
                <p>A former driver finds himself back in action when he returns to Formula 1 racing to take on the sport's top competition.</p>
            </div>
        </div>

        <!-- Card 3 -->
        <div class="movie-card">
            <img src="Assets/homepageImages/how_to_train_ur_dragon.jpg" alt="Movie 3">
            <div class="movie-details">
                <h3>How to Train your Dragon</h3>
                <p>How to Train Your Dragon is an upcoming American fantasy film written, co-produced,and directed by Dean DeBlois.</p>
            </div>
        </div>

        <!-- Card 4 -->
        <div class="movie-card">
            <img src="Assets/homepageImages/mufasa.jpg" alt="Movie 4">
            <div class="movie-details">
                <h3>Mufasa: The Lion King</h3>
                <p>Lost and alone, orphaned cub Mufasa meets a sympathetic lion named Taka, the heir to a royal bloodline.</p>
            </div>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp" />

<!-- carousal script -->
<script src="Assets/script.js"></script>
<script>
    function toggleMenu() {
        const nav = document.getElementById('navMenu');
        const bars = document.querySelectorAll('.bar');

        // Toggle active class for navigation
        nav.classList.toggle('active');
    }
</script>

</body>
</html>
