<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile – KickOff</title>
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=DM+Sans:wght@400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="<%= ctx %>/CSS/userdashboard.css"/>
</head>
<body>

  <!-- ===== NAVBAR ===== -->
  <nav class="navbar">
    <a href="<%= ctx %>/Pages/Root/Homepage.jsp" class="navbar_logo">Kick<span>Off</span></a>
    <ul class="navbar_links">
      <li><a href="<%= ctx %>/Pages/Root/Homepage.jsp">Home</a></li>
      <li><a href="<%= ctx %>/Pages/Root/grounds.jsp">Grounds</a></li>
      <li><a href="<%= ctx %>/Pages/Root/teams.jsp">Teams</a></li>
      <li><a href="<%= ctx %>/Pages/Root/about.jsp">About</a></li>
    </ul>
    <div class="navbar_avatar">
      <img src="<%= ctx %>/${user.image}"
           onerror="this.src='<%= ctx %>/Assets/default-avatar.png'"
           class="avatar_img" alt="Profile"/>
    </div>
  </nav>

  <div class="layout">

    <!-- ===== SIDEBAR ===== -->
    <aside class="sidebar">
      <a href="<%= ctx %>/Pages/User/dashboard.jsp" class="sidebar_item">My Profile</a>
      <a href="<%= ctx %>/Pages/User/myteam.jsp"    class="sidebar_item">My Team</a>
      <a href="<%= ctx %>/Pages/User/bookings.jsp"  class="sidebar_item">My Bookings</a>
      <a href="<%= ctx %>/LogoutServlet"            class="sidebar_item">Logout</a>
    </aside>

    <!-- ===== MAIN ===== -->
    <main class="main">

      <!-- ===== PROFILE CARD ===== -->
      <div class="profile_card">

        <!-- Avatar + name -->
        <div class="profile_top">

          <!-- Profile Image -->
          <div class="profile_avatar">
            <img src="<%= ctx %>/${user.image}"
                 onerror="this.style.display='none'"
                 class="profile_avatar_img"
                 alt="Profile Image"/>
          </div>

          <div class="profile_info">
            <h2 class="profile_name">${user.firstName} ${user.lastName}</h2>
            <p class="profile_role">${user.role}</p>
          </div>
        </div>

        <hr class="profile_divider"/>

        <!-- Details grid -->
        <div class="profile_grid">

          <div class="profile_field">
            <span class="field_label">Email</span>
            <span class="field_value">${user.email}</span>
          </div>

          <div class="profile_field">
            <span class="field_label">Phone</span>
            <span class="field_value">
              ${not empty user.phone ? user.phone : 'Not provided'}
            </span>
          </div>

          <div class="profile_field">
            <span class="field_label">Favourite Sport</span>
            <span class="field_value">
              ${not empty user.sport ? user.sport : 'Not set'}
            </span>
          </div>

          <div class="profile_field">
            <span class="field_label">Skill Level</span>
            <span class="field_value">
              <span class="badge badge_blue">
                ${not empty user.skillLevel ? user.skillLevel : 'Not set'}
              </span>
            </span>
          </div>

          <div class="profile_field">
            <span class="field_label">Member Since</span>
            <span class="field_value">${user.createdAt}</span>
          </div>

          <div class="profile_field">
            <span class="field_label">Role</span>
            <span class="field_value">
              <span class="badge badge_green">${user.role}</span>
            </span>
          </div>

        </div>

        <hr class="profile_divider"/>

        <!-- Actions -->
        <div class="profile_actions">
          <a href="#" class="btn btn_primary">Edit Profile</a>
          <a href="#" class="btn btn_outline">Change Password</a>
        </div>

      </div>

    </main>
  </div>

</body>
</html>