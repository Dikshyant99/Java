<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Users – KickOff Admin</title>
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
      <a href="<%= ctx %>/Pages/Admin/users.jsp"    class="sidebar_item active">Users</a>
      <a href="<%= ctx %>/Pages/Admin/grounds.jsp"  class="sidebar_item">Grounds</a>
      <a href="<%= ctx %>/Pages/Admin/teams.jsp"    class="sidebar_item">Teams</a>
      <a href="<%= ctx %>/Pages/Admin/bookings.jsp" class="sidebar_item">Booking Requests</a>
      <a href="<%= ctx %>/LogoutServlet"            class="sidebar_item">Logout</a>
    </aside>

    <main class="main">
      <p class="page_title">Users</p>

      <!-- Search bar -->
      <div style="margin-bottom:20px;">
        <input type="text" id="searchInput" placeholder="Search users..."
               onkeyup="filterTable()"
               style="padding:10px 16px; border-radius:8px; border:1px solid #2a2a2a;
                      background:#1a1a1a; color:#f0f0f0; font-size:14px; width:300px;
                      font-family:'DM Sans',sans-serif;"/>
      </div>

      <!-- Users table -->
      <div style="background:#1a1a1a; border-radius:14px; overflow:hidden;">
        <table id="usersTable"
               style="width:100%; border-collapse:collapse; font-size:14px;">
          <thead>
            <tr style="background:#2a6fdb; color:#fff;">
              <th style="padding:14px 20px; text-align:left;">#</th>
              <th style="padding:14px 20px; text-align:left;">Name</th>
              <th style="padding:14px 20px; text-align:left;">Email</th>
              <th style="padding:14px 20px; text-align:left;">Phone</th>
              <th style="padding:14px 20px; text-align:left;">Sport</th>
              <th style="padding:14px 20px; text-align:left;">Role</th>
              <th style="padding:14px 20px; text-align:left;">Joined</th>
              <th style="padding:14px 20px; text-align:left;">Action</th>
            </tr>
          </thead>
          <tbody>
            <%-- Static placeholder rows - will be replaced by c:forEach when servlet is built --%>
            <tr style="border-bottom:1px solid #2a2a2a;">
              <td style="padding:14px 20px; color:#888;">1</td>
              <td style="padding:14px 20px; color:#f0f0f0; font-weight:500;">John Doe</td>
              <td style="padding:14px 20px; color:#aaa;">john@test.com</td>
              <td style="padding:14px 20px; color:#aaa;">9812345678</td>
              <td style="padding:14px 20px; color:#aaa;">Football</td>
              <td style="padding:14px 20px;">
                <span class="badge badge_blue">user</span>
              </td>
              <td style="padding:14px 20px; color:#aaa;">2026-04-15</td>
              <td style="padding:14px 20px;">
                <a href="#" class="btn btn_red"
                   onclick="return confirm('Delete this user?')">Delete</a>
              </td>
            </tr>
            <tr style="border-bottom:1px solid #2a2a2a;">
              <td style="padding:14px 20px; color:#888;">2</td>
              <td style="padding:14px 20px; color:#f0f0f0; font-weight:500;">Admin KickOff</td>
              <td style="padding:14px 20px; color:#aaa;">admin@kickoff.com</td>
              <td style="padding:14px 20px; color:#aaa;">9800000000</td>
              <td style="padding:14px 20px; color:#aaa;">Football</td>
              <td style="padding:14px 20px;">
                <span class="badge badge_green">admin</span>
              </td>
              <td style="padding:14px 20px; color:#aaa;">2026-04-01</td>
              <td style="padding:14px 20px;">
                <a href="#" class="btn btn_red"
                   onclick="return confirm('Delete this user?')">Delete</a>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

    </main>
  </div>

  <script>
    function filterTable() {
      var input = document.getElementById("searchInput").value.toLowerCase();
      var rows  = document.querySelectorAll("#usersTable tbody tr");
      rows.forEach(function(row) {
        row.style.display = row.innerText.toLowerCase().includes(input) ? "" : "none";
      });
    }
  </script>

</body>
</html>