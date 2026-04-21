<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard – KickOff</title>
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=DM+Sans:wght@400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="<%= ctx %>/CSS/admindashboard.css"/>
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
    <span class="admin_badge">Admin</span>
  </nav>

  <div class="layout">

    <!-- ===== SIDEBAR ===== -->
    <aside class="sidebar">
      <a href="<%= ctx %>/AdminServlet"              class="sidebar_item active">Overview</a>
      <a href="<%= ctx %>/Pages/Admin/users.jsp"     class="sidebar_item">Users</a>
      <a href="<%= ctx %>/Pages/Admin/grounds.jsp"   class="sidebar_item">Grounds</a>
      <a href="<%= ctx %>/Pages/Admin/teams.jsp"     class="sidebar_item">Teams</a>
      <a href="<%= ctx %>/Pages/Admin/bookings.jsp"  class="sidebar_item">Booking Requests</a>
      <a href="<%= ctx %>/LogoutServlet"             class="sidebar_item">Logout</a>
    </aside>

    <!-- ===== MAIN ===== -->
    <main class="main">

      <p class="page_title">Overview</p>

      <%-- Success / Error messages --%>
      <% if (request.getAttribute("successMsg") != null) { %>
        <div class="msg_success"><%= request.getAttribute("successMsg") %></div>
      <% } %>
      <% if (request.getAttribute("errorMsg") != null) { %>
        <div class="msg_error"><%= request.getAttribute("errorMsg") %></div>
      <% } %>

      <!-- ===== STAT CARDS ===== -->
      <div class="stats_grid">
        <div class="stat_card">
          <div class="stat_label">Total Teams</div>
          <div class="stat_value">
            <%= request.getAttribute("totalTeams") != null ? request.getAttribute("totalTeams") : "0" %>
          </div>
        </div>
        <div class="stat_card">
          <div class="stat_label">Total Users</div>
          <div class="stat_value">
            <%= request.getAttribute("totalUsers") != null ? request.getAttribute("totalUsers") : "0" %>
          </div>
        </div>
        <div class="stat_card">
          <div class="stat_label">Grounds</div>
          <div class="stat_value">
            <%= request.getAttribute("totalGrounds") != null ? request.getAttribute("totalGrounds") : "0" %>
          </div>
        </div>
        <div class="stat_card">
          <div class="stat_label">Bookings</div>
          <div class="stat_value">
            <%= request.getAttribute("totalBookings") != null ? request.getAttribute("totalBookings") : "0" %>
          </div>
        </div>
      </div>

      <!-- ===== RECENT USERS ===== -->
      <div class="section">
        <div class="section_title">Recent Users</div>
        <c:choose>
          <c:when test="${empty requestScope.recentUsers}">
            <div class="empty">No users registered yet.</div>
          </c:when>
          <c:otherwise>
            <c:forEach var="user" items="${requestScope.recentUsers}">
              <div class="list_item">
                <div>
                  <div class="list_item_name">${user.firstName} ${user.lastName}</div>
                  <div class="list_item_meta">${user.email} &nbsp;·&nbsp; ${user.sport}</div>
                </div>
                <div class="list_item_right">
                  <span class="badge badge_blue">${user.role}</span>
                  <a href="<%= ctx %>/AdminServlet?action=deleteUser&id=${user.userId}"
                     class="btn btn_red"
                     onclick="return confirm('Delete this user?')">Delete</a>
                </div>
              </div>
            </c:forEach>
          </c:otherwise>
        </c:choose>
      </div>

      <!-- ===== RECENT BOOKINGS ===== -->
      <div class="section">
        <div class="section_title">Recent Booking Requests</div>
        <c:choose>
          <c:when test="${empty requestScope.recentBookings}">
            <div class="empty">No booking requests yet.</div>
          </c:when>
          <c:otherwise>
            <c:forEach var="booking" items="${requestScope.recentBookings}">
              <div class="list_item">
                <div>
                  <div class="list_item_name">${booking.groundName}</div>
                  <div class="list_item_meta">
                    ${booking.userName} &nbsp;·&nbsp;
                    ${booking.slotDate} &nbsp;·&nbsp;
                    ${booking.startTime} – ${booking.endTime}
                  </div>
                </div>
                <div class="list_item_right">
                  <c:choose>
                    <c:when test="${booking.status == 'confirmed'}">
                      <span class="badge badge_green">Approved</span>
                    </c:when>
                    <c:when test="${booking.status == 'pending'}">
                      <span class="badge badge_yellow">Pending</span>
                      <a href="<%= ctx %>/AdminServlet?action=approveBooking&id=${booking.bookingId}"
                         class="btn btn_green">Approve</a>
                      <a href="<%= ctx %>/AdminServlet?action=rejectBooking&id=${booking.bookingId}"
                         class="btn btn_red">Reject</a>
                    </c:when>
                    <c:otherwise>
                      <span class="badge badge_red">Cancelled</span>
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </c:forEach>
          </c:otherwise>
        </c:choose>
      </div>

      <!-- ===== RECENT TEAMS ===== -->
      <div class="section">
        <div class="section_title">Recent Teams</div>
        <c:choose>
          <c:when test="${empty requestScope.recentTeams}">
            <div class="empty">No teams created yet.</div>
          </c:when>
          <c:otherwise>
            <c:forEach var="team" items="${requestScope.recentTeams}">
              <div class="list_item">
                <div>
                  <div class="list_item_name">${team.name}</div>
                  <div class="list_item_meta">
                    ${team.sportType} &nbsp;·&nbsp;
                    ${team.location} &nbsp;·&nbsp;
                    ${team.currentPlayers}/${team.maxPlayers} players
                  </div>
                </div>
                <div class="list_item_right">
                  <c:choose>
                    <c:when test="${team.recruitmentStatus == 'open'}">
                      <span class="badge badge_green">Open</span>
                    </c:when>
                    <c:otherwise>
                      <span class="badge badge_red">Closed</span>
                    </c:otherwise>
                  </c:choose>
                  <a href="<%= ctx %>/AdminServlet?action=deleteTeam&id=${team.teamId}"
                     class="btn btn_red"
                     onclick="return confirm('Delete this team?')">Delete</a>
                </div>
              </div>
            </c:forEach>
          </c:otherwise>
        </c:choose>
      </div>

    </main>
  </div>

</body>
</html>