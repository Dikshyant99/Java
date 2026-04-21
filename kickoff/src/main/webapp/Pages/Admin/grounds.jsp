<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Grounds – KickOff Admin</title>
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=DM+Sans:wght@400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="<%= ctx %>/CSS/admindashboard.css"/>
</head>
<body>

  <nav class="navbar">
    <a href="<%= ctx %>/Pages/Root/Homepage.jsp" class="navbar_logo">Kick<span>Off</span></a>
    <ul class="navbar_links">
      <li><a href="<%= ctx %>/Pages/Root/Homepage.jsp">Home</a></li>
      <li><a href="<%= ctx %>/Pages/Root/grounds.jsp">Grounds</a></li>
      <li><a href="<%= ctx %>/Pages/Root/teams.jsp">Teams</a></li>
      <li><a href="<%= ctx %>/Pages/Root/about.jsp">About</a></li>
    </ul>
    <span class="admin_badge">Admin</span>
  </nav>

  <div class="layout">
    <aside class="sidebar">
      <a href="<%= ctx %>/AdminServlet"             class="sidebar_item">Overview</a>
      <a href="<%= ctx %>/Pages/Admin/users.jsp"    class="sidebar_item">Users</a>
      <a href="<%= ctx %>/Pages/Admin/grounds.jsp"  class="sidebar_item active">Grounds</a>
      <a href="<%= ctx %>/Pages/Admin/teams.jsp"    class="sidebar_item">Teams</a>
      <a href="<%= ctx %>/Pages/Admin/bookings.jsp" class="sidebar_item">Booking Requests</a>
      <a href="<%= ctx %>/LogoutServlet"            class="sidebar_item">Logout</a>
    </aside>

    <main class="main">
      <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:24px;">
        <p class="page_title" style="margin-bottom:0;">Grounds</p>
        <a href="#" class="btn btn_primary">+ Add Ground</a>
      </div>

      <!-- Search -->
      <div style="margin-bottom:20px;">
        <input type="text" id="groundSearch" placeholder="Search grounds..."
               onkeyup="filterGrounds()"
               style="padding:10px 16px; border-radius:8px; border:1px solid #2a2a2a;
                      background:#1a1a1a; color:#f0f0f0; font-size:14px; width:300px;
                      font-family:'DM Sans',sans-serif;"/>
      </div>

      <!-- Grounds list -->
      <div id="groundsList">

        <div class="list_item">
          <div>
            <div class="list_item_name">City Football Arena</div>
            <div class="list_item_meta">
              Kathmandu &nbsp;·&nbsp; Football &nbsp;·&nbsp;
              Rs 800/hr &nbsp;·&nbsp; Owner: Admin KickOff
            </div>
          </div>
          <div class="list_item_right">
            <span class="badge badge_green">Active</span>
            <a href="#" class="btn btn_outline">Edit</a>
            <a href="#" class="btn btn_red"
               onclick="return confirm('Delete this ground?')">Delete</a>
          </div>
        </div>

        <div class="list_item">
          <div>
            <div class="list_item_name">Lalitpur Cricket Ground</div>
            <div class="list_item_meta">
              Lalitpur &nbsp;·&nbsp; Cricket &nbsp;·&nbsp;
              Rs 1200/hr &nbsp;·&nbsp; Owner: Admin KickOff
            </div>
          </div>
          <div class="list_item_right">
            <span class="badge badge_green">Active</span>
            <a href="#" class="btn btn_outline">Edit</a>
            <a href="#" class="btn btn_red"
               onclick="return confirm('Delete this ground?')">Delete</a>
          </div>
        </div>

        <div class="list_item">
          <div>
            <div class="list_item_name">Bhaktapur Sports Court</div>
            <div class="list_item_meta">
              Bhaktapur &nbsp;·&nbsp; Basketball &nbsp;·&nbsp;
              Rs 600/hr &nbsp;·&nbsp; Owner: Admin KickOff
            </div>
          </div>
          <div class="list_item_right">
            <span class="badge badge_yellow">Inactive</span>
            <a href="#" class="btn btn_outline">Edit</a>
            <a href="#" class="btn btn_red"
               onclick="return confirm('Delete this ground?')">Delete</a>
          </div>
        </div>

      </div>
    </main>
  </div>

  <script>
    function filterGrounds() {
      var input = document.getElementById("groundSearch").value.toLowerCase();
      var items = document.querySelectorAll("#groundsList .list_item");
      items.forEach(function(item) {
        item.style.display = item.innerText.toLowerCase().includes(input) ? "flex" : "none";
      });
    }
  </script>

</body>
</html>