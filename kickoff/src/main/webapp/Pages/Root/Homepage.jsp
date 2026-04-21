<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>KICKOFF</title>
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=DM+Sans:wght@400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="<%= ctx %>/CSS/homepage.css"/>
</head>
<body>

  <!-- ===== NAVBAR ===== -->
  <nav class="navbar">
    <a href="<%= ctx %>/Pages/Root/Homepage.jsp" class="navbar_logo">Kick<span>Off</span></a>
    <ul class="navbar_links">
      <li><a href="<%= ctx %>/Pages/Root/Homepage.jsp" class="active">Home</a></li>
      <li><a href="<%= ctx %>/Pages/Root/grounds.jsp">Grounds</a></li>
      <li><a href="<%= ctx %>/Pages/Root/teams.jsp">Teams</a></li>
      <li><a href="<%= ctx %>/Pages/Root/findPlayers.jsp">Find Players</a></li>
      <li><a href="<%= ctx %>/Pages/Root/about.jsp">About</a></li>
    </ul>
    <div class="navbar_actions">
      <% if (Boolean.TRUE.equals(session.getAttribute("loggedIn"))) { %>
        <span class="welcome_text">
          Hi, <%= session.getAttribute("firstName") %>
        </span>
        <% if ("admin".equals(session.getAttribute("role"))) { %>
          <a href="<%= ctx %>/Pages/Admin/dashboard.jsp" class="login_btn">Dashboard</a>
        <% } else { %>
          <a href="<%= ctx %>/Pages/User/dashboard.jsp" class="login_btn">Dashboard</a>
        <% } %>
        <a href="<%= ctx %>/LogoutServlet" class="register_btn">Logout</a>
      <% } else { %>
        <a href="<%= ctx %>/Pages/Auth/login.jsp" class="login_btn">Login</a>
        <a href="<%= ctx %>/Pages/Auth/Register.jsp" class="register_btn">Register</a>
      <% } %>
    </div>
  </nav>

  <!-- ===== HERO ===== -->
  <section class="hero">
    <h1 class="hero_title">
      BOOK &nbsp;·&nbsp; PLAY &nbsp;·&nbsp; <span>Connect</span>
    </h1>
    <p class="hero_subtitle">
      Find sports grounds, build your team, and challenge others to a match.
    </p>

    <%-- Welcome message after login --%>
    <% if (Boolean.TRUE.equals(session.getAttribute("loggedIn"))) { %>
      <div class="hero_welcome">
        Welcome back, <%= session.getAttribute("firstName") %>!
      </div>
    <% } %>

    <div class="hero_search_bar">
      <form action="<%= ctx %>/search" method="get"
            style="display:flex; gap:10px; width:100%;">
        <input type="text" name="q"
               placeholder="Search grounds, sports, location..."/>
        <button type="submit" class="search_btn">Search</button>
      </form>
    </div>

    <div class="hero_tags">
      <a href="<%= ctx %>/search?sport=Football" class="tag">Football</a>
      <a href="<%= ctx %>/search?sport=Cricket" class="tag">Cricket</a>
      <a href="<%= ctx %>/search?sport=Basketball" class="tag">Basketball</a>
      <a href="<%= ctx %>/search?sport=Tennis" class="tag">Tennis</a>
    </div>
  </section>

  <hr class="section_divider"/>

  <!-- ===== AVAILABLE GROUNDS ===== -->
  <div class="section">
    <div class="section_header">
      <h2 class="section_title">Available Grounds</h2>
      <a href="<%= ctx %>/Pages/Root/grounds.jsp" class="section_link">View all →</a>
    </div>
    <div class="card_grid">

      <a href="<%= ctx %>/Pages/Root/ground-detail.jsp" class="ground_card">
        <div class="ground_card_image">
          <img src="<%= ctx %>/Assets/oldtrff.jpg"
               style="width:100%; height:100%; object-fit:cover; object-position:bottom;"
               alt="City Football Arena"/>
        </div>
        <div class="ground_card_body">
          <div class="ground_card_name">City Football Arena</div>
          <div class="ground_card_meta">Kathmandu · Football</div>
          <div class="ground_card_footer">
            <span class="ground_card_price">Rs 800/hr</span>
            <span class="badge badge_green">Available</span>
          </div>
        </div>
      </a>

      <a href="<%= ctx %>/Pages/Root/ground-detail.jsp" class="ground_card">
        <div class="ground_card_image">
          <img src="<%= ctx %>/Assets/cricket.jpg"
               style="width:100%; height:100%; object-fit:cover; object-position:bottom;"
               alt="Lalitpur Cricket Ground"/>
        </div>
        <div class="ground_card_body">
          <div class="ground_card_name">Lalitpur Cricket Ground</div>
          <div class="ground_card_meta">Lalitpur · Cricket</div>
          <div class="ground_card_footer">
            <span class="ground_card_price">Rs 1200/hr</span>
            <span class="badge badge_green">Available</span>
          </div>
        </div>
      </a>

      <a href="<%= ctx %>/Pages/Root/ground-detail.jsp" class="ground_card">
        <div class="ground_card_image">
          <img src="<%= ctx %>/Assets/basketball.jpg"
               style="width:100%; height:100%; object-fit:cover; object-position:center;"
               alt="Bhaktapur Sports Court"/>
        </div>
        <div class="ground_card_body">
          <div class="ground_card_name">Bhaktapur Sports Court</div>
          <div class="ground_card_meta">Bhaktapur · Basketball</div>
          <div class="ground_card_footer">
            <span class="ground_card_price">Rs 600/hr</span>
            <span class="badge badge_yellow">Few Slots</span>
          </div>
        </div>
      </a>

    </div>
  </div>

  <hr class="section_divider"/>

  <!-- ===== OPEN TEAMS RECRUITING ===== -->
  <div class="section">
    <div class="section_header">
      <h2 class="section_title">Open Teams Recruiting</h2>
      <a href="<%= ctx %>/Pages/Root/teams.jsp" class="section_link">View all →</a>
    </div>
    <div class="card_grid">

      <a href="<%= ctx %>/Pages/Root/team-detail.jsp" class="team_card">
        <div class="team_card_name">Thunder FC</div>
        <div class="team_card_meta">
          Football · Needs 3 players<br/>
          Kathmandu · Intermediate
        </div>
        <span class="badge badge_blue">Recruiting</span>
      </a>

      <a href="<%= ctx %>/Pages/Root/team-detail.jsp" class="team_card">
        <div class="team_card_name">Storm Cricket XI</div>
        <div class="team_card_meta">
          Cricket · Needs 2 players<br/>
          Lalitpur · Advanced
        </div>
        <span class="badge badge_blue">Recruiting</span>
      </a>

      <a href="<%= ctx %>/Pages/Root/team-detail.jsp" class="team_card">
        <div class="team_card_name">Hoops KTM</div>
        <div class="team_card_meta">
          Basketball · Full team<br/>
          Kathmandu · Beginner
        </div>
        <span class="badge badge_red">Closed</span>
      </a>

    </div>
  </div>

  <hr class="section_divider"/>

  <!-- ===== FOOTER ===== -->
  <footer class="footer">
    <a href="<%= ctx %>/Pages/Root/Homepage.jsp" class="footer_logo">Kick<span>Off</span></a>
    <ul class="footer_links">
      <li><a href="<%= ctx %>/Pages/Root/Homepage.jsp">Home</a></li>
      <li><a href="<%= ctx %>/Pages/Root/about.jsp">About</a></li>
      <li><a href="<%= ctx %>/Pages/Root/contact.jsp">Contact</a></li>
    </ul>
    <p class="footer_copy">© 2026 KickOff. All rights reserved.</p>
  </footer>

</body>
</html>