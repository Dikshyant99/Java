<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Bookings – KickOff Admin</title>
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
      <a href="<%= ctx %>/Pages/Admin/grounds.jsp"  class="sidebar_item">Grounds</a>
      <a href="<%= ctx %>/Pages/Admin/teams.jsp"    class="sidebar_item">Teams</a>
      <a href="<%= ctx %>/Pages/Admin/bookings.jsp" class="sidebar_item active">Booking Requests</a>
      <a href="<%= ctx %>/LogoutServlet"            class="sidebar_item">Logout</a>
    </aside>

    <main class="main">
      <p class="page_title">Booking Requests</p>

      <!-- Filter tabs -->
      <div style="display:flex; gap:10px; margin-bottom:20px;">
        <button class="btn btn_primary" onclick="filterStatus('all')">All</button>
        <button class="btn btn_outline" onclick="filterStatus('pending')">Pending</button>
        <button class="btn btn_green"   onclick="filterStatus('confirmed')">Approved</button>
        <button class="btn btn_red"     onclick="filterStatus('cancelled')">Cancelled</button>
      </div>

      <!-- Bookings list -->
      <div id="bookingsList">

        <div class="list_item" data-status="pending">
          <div>
            <div class="list_item_name">Kritipur Stadium</div>
            <div class="list_item_meta">
              John Doe &nbsp;·&nbsp; 2026-04-14 &nbsp;·&nbsp; 06:00 PM – 08:00 PM
              &nbsp;·&nbsp; Rs 1600
            </div>
          </div>
          <div class="list_item_right">
            <span class="badge badge_yellow">Pending</span>
            <a href="#" class="btn btn_green">Approve</a>
            <a href="#" class="btn btn_red">Reject</a>
          </div>
        </div>

        <div class="list_item" data-status="confirmed">
          <div>
            <div class="list_item_name">Bhaktapur Court</div>
            <div class="list_item_meta">
              Jane Smith &nbsp;·&nbsp; 2026-04-15 &nbsp;·&nbsp; 07:00 PM – 09:00 PM
              &nbsp;·&nbsp; Rs 1200
            </div>
          </div>
          <div class="list_item_right">
            <span class="badge badge_green">Approved</span>
          </div>
        </div>

        <div class="list_item" data-status="cancelled">
          <div>
            <div class="list_item_name">Lalitpur Cricket Ground</div>
            <div class="list_item_meta">
              Ram Sharma &nbsp;·&nbsp; 2026-04-13 &nbsp;·&nbsp; 02:00 PM – 04:00 PM
              &nbsp;·&nbsp; Rs 2400
            </div>
          </div>
          <div class="list_item_right">
            <span class="badge badge_red">Cancelled</span>
          </div>
        </div>

      </div>
    </main>
  </div>

  <script>
    function filterStatus(status) {
      var items = document.querySelectorAll("#bookingsList .list_item");
      items.forEach(function(item) {
        if (status === 'all' || item.dataset.status === status) {
          item.style.display = "flex";
        } else {
          item.style.display = "none";
        }
      });
    }
  </script>

</body>
</html>