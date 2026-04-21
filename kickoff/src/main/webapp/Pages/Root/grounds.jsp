<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>KickOff — Grounds</title>
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=DM+Sans:ital,wght@0,400;0,500;0,600;1,400&display=swap" rel="stylesheet"/>
  <link rel="icon" type="image" href="KickOff logo.png">
  <link rel="stylesheet" href="../../CSS/grounds.css"/>
</head>
<body>

  <!-- ===== NAVBAR ===== -->
  <nav class="navbar">
    <a href="Homepage.jsp" class="navbar_logo">Kick<span>Off</span></a>
    <ul class="navbar_links">
      <li><a href="Homepage.jsp">Home</a></li>
      <li><a href="grounds.jsp" class="active">Grounds</a></li>
      <li><a href="teams.jsp">Teams</a></li>
      <li><a href="about.jsp">About</a></li>
    </ul>
    <div class="navbar_actions">
      <a href="../Auth/login.jsp" class="btn btn--outline">Login</a>
      <a href="register.jsp" class="btn btn--primary">Register</a>
    </div>
  </nav>

  <!-- ===== PAGE HEADER ===== -->
  <div class="page-header">
    <h1 class="page-header_title">Browse <span>Grounds</span></h1>
    <p class="page-header_sub">Find and book sports grounds near you</p>
    <div class="page-header_search">
      <input type="text" placeholder="Search grounds, sports, location..."/>
      <button>Search</button>
    </div>
  </div>

  <!-- ===== MAIN LAYOUT ===== -->
  <div class="grounds-layout">

    <!-- SIDEBAR -->
    <aside class="sidebar">

      <div class="sidebar_block">
        <label class="sidebar_label">Sport</label>
        <ul class="sidebar_list">
          <li class="sidebar_item active">All Sports</li>
          <a href="ground-detail.jsp">
          <li class="sidebar_item">Football</li>
            </a>
          <a href="lalitpur.jsp">
          <li class="sidebar_item">Cricket</li>
            </a>
          <a href="bhaktapur.jsp">
          <li class="sidebar_item">Basketball</li>
            </a>
          <a href="kritipurVolley.jsp">
          <li class="sidebar_item">Volleyball</li>
            </a>
          <a href="patan.jsp">
          <li class="sidebar_item">Tennis</li>
            </a>
        </ul>
      </div>

      <div class="sidebar_block">
        <label class="sidebar_label">Availability</label>
        <ul class="sidebar_list">
          <li class="sidebar_item active">All</li>
          <li class="sidebar_item">Available Now</li>
        </ul>
      </div>

      <div class="sidebar_block">
        <label class="sidebar_label">Location</label>
        <ul class="sidebar_list">
          <li class="sidebar_item active">All Areas</li>
          <li class="sidebar_item">Kathmandu</li>
          <li class="sidebar_item">Lalitpur</li>
          <li class="sidebar_item">Bhaktapur</li>
        </ul>
      </div>

    </aside>

    <!-- GROUNDS MAIN -->
    <main class="grounds-main">

      <div class="grounds-top">
        <p class="grounds-count">Showing 6 grounds</p>
        <div class="grounds-sort">
          Sort by
          <select>
            <option>Price: Low to High</option>
            <option>Price: High to Low</option>
            <option>Availability</option>
          </select>
        </div>
      </div>

      <div class="cards-grid">

        <a href="ground-detail.jsp" class="ground-card">
          <div class="ground-card_image"><img src="../../Assets/oldtrff.jpg" alt="City Football Arena"></div>
          <div class="ground-card_body">
            <div class="ground-card_name">City Football Arena</div>
            <div class="ground-card_meta">Kathmandu · Football</div>
            <div class="ground-card_footer">
              <span class="ground-card_price">Rs 1000/hr</span>
              <span class="badge badge--green">Available</span>
            </div>
          </div>
        </a>

        <a href="lalitpur.jsp" class="ground-card">
          <div class="ground-card_image"><img src="../../Assets/cricket.jpg" alt="Lalitpur Cricket Ground"></div>
          <div class="ground-card_body">
            <div class="ground-card_name">Lalitpur Cricket Ground</div>
            <div class="ground-card_meta">Lalitpur · Cricket</div>
            <div class="ground-card_footer">
              <span class="ground-card_price">Rs 1200/hr</span>
              <span class="badge badge--green">Available</span>
            </div>
          </div>
        </a>

        <a href="bhaktapur.jsp" class="ground-card">
          <div class="ground-card_image"><img src="../../Assets/basketball.jpg" alt="Bhaktapur Court"></div>
          <div class="ground-card_body">
            <div class="ground-card_name">Bhaktapur Court</div>
            <div class="ground-card_meta">Bhaktapur · Basketball</div>
            <div class="ground-card_footer">
              <span class="ground-card_price">Rs 1250/hr</span>
              <span class="badge badge--amber">Few Slots</span>
            </div>
          </div>
        </a>

        <a href="patan.jsp" class="ground-card">
          <div class="ground-card_image"><img src="../../Assets/tennis.jpg" alt="Patan Tennis Hall"></div>
          <div class="ground-card_body">
            <div class="ground-card_name">Patan Tennis Hall</div>
            <div class="ground-card_meta">Lalitpur · Tennis</div>
            <div class="ground-card_footer">
              <span class="ground-card_price">Rs 2500/hr</span>
              <span class="badge badge--green">Available</span>
            </div>
          </div>
        </a>

        <a href="kritipurVolley.jsp" class="ground-card">
          <div class="ground-card_image"><img src="../../Assets/volley.jpg.webp" alt="Kritipur Volleyball Court"></div>
          <div class="ground-card_body">
            <div class="ground-card_name">Kirtipur Volleyball Court</div>
            <div class="ground-card_meta">Kathmandu · Volleyball</div>
            <div class="ground-card_footer">
              <span class="ground-card_price">Rs 1000/hr</span>
              <span class="badge badge--green">Available</span>
            </div>
          </div>
        </a>

        <a href="kritipurStadium.jsp" class="ground-card">
          <div class="ground-card_image"><img src="../../Assets/tu-ground.jpg" alt="Kritipur Stadium"></div>
          <div class="ground-card_body">
            <div class="ground-card_name">Kirtipur Stadium</div>
            <div class="ground-card_meta">Kathmandu · Cricket</div>
            <div class="ground-card_footer">
              <span class="ground-card_price">Rs 1500/hr</span>
              <span class="badge badge--red">Booked</span>
            </div>
          </div>
        </a>

      </div>
    </main>
  </div>

  <!-- ===== FOOTER ===== -->
  <footer class="footer">
    <a href="Homepage.jsp" class="footer_logo">Kick<span>Off</span></a>
    <ul class="footer_links">
      <li><a href="contact.jsp">Contact</a></li>
      <li><a href="#">Privacy</a></li>
    </ul>
    <p class="footer_copy">© 2026 KickOff. All rights reserved.</p>
  </footer>

</body>
</html>