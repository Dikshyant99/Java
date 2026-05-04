<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Bookings – KickOff</title>
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=DM+Sans:wght@400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/userdashboard.css"/>
</head>
<body>

  <!-- ===== NAVBAR ===== -->
  <nav class="navbar">
    <a href="${pageContext.request.contextPath}/Pages/Root/Homepage.jsp" class="navbar_logo">Kick<span>Off</span></a>
    <ul class="navbar_links">
      <li><a href="${pageContext.request.contextPath}/Pages/Root/Homepage.jsp">Home</a></li>
      <li><a href="${pageContext.request.contextPath}/Pages/Root/grounds.jsp">Grounds</a></li>
      <li><a href="${pageContext.request.contextPath}/Pages/Root/teams.jsp">Teams</a></li>
      <li><a href="${pageContext.request.contextPath}/Pages/Root/about.jsp">About</a></li>
    </ul>
    <div class="navbar_avatar">
      <img src="${pageContext.request.contextPath}/Assets/avatar.png"
           class="avatar_img" alt="Profile"/>
    </div>
  </nav>

  <div class="layout">

    <!-- ===== SIDEBAR ===== -->
    <a href="${pageContext.request.contextPath}/ProfileServlet"          class="sidebar_item active">My Profile</a>
	<a href="${pageContext.request.contextPath}/Pages/User/myteam.jsp"   class="sidebar_item">My Team</a>
	<a href="${pageContext.request.contextPath}/Pages/User/bookings.jsp" class="sidebar_item">My Bookings</a>
	<a href="${pageContext.request.contextPath}/LogoutServlet"           class="sidebar_item">Logout</a>

    <!-- ===== MAIN ===== -->
    <main class="main">

      <%-- Success / Error messages using c:if --%>
      <c:if test="${not empty sessionScope.successMsg}">
        <div class="msg_success">${sessionScope.successMsg}</div>
        <c:remove var="successMsg" scope="session"/>
      </c:if>
      <c:if test="${not empty sessionScope.errorMsg}">
        <div class="msg_error">${sessionScope.errorMsg}</div>
        <c:remove var="errorMsg" scope="session"/>
      </c:if>

      <!-- Page header -->
      <div class="page_header">
        <p class="page_title">My Bookings</p>
        <a href="${pageContext.request.contextPath}/Pages/Root/grounds.jsp"
           class="btn btn_primary">+ Book a Ground</a>
      </div>

      <!-- Filter tabs -->
      <div class="filter_tabs">
        <button class="btn btn_primary"  onclick="filterBookings('all')">All</button>
        <button class="btn btn_outline"  onclick="filterBookings('pending')">Pending</button>
        <button class="btn btn_green"    onclick="filterBookings('confirmed')">Confirmed</button>
        <button class="btn btn_red"      onclick="filterBookings('cancelled')">Cancelled</button>
      </div>

      <!-- Bookings list -->
      <div class="bookings_list" id="bookingsList">

        <div class="booking_item" data-status="pending">
          <div>
            <div class="booking_name">City Football Arena</div>
            <div class="booking_meta">
              Kathmandu &nbsp;·&nbsp; Football<br/>
              April 14, 2026 &nbsp;·&nbsp; 6:00 PM – 8:00 PM<br/>
              Total: Rs 1,600
            </div>
          </div>
          <div class="booking_right">
            <span class="badge badge_yellow">Pending</span>
            <a href="#" class="btn btn_red"
               onclick="return confirm('Cancel this booking?')">Cancel</a>
          </div>
        </div>

        <div class="booking_item" data-status="confirmed">
          <div>
            <div class="booking_name">Lalitpur Cricket Ground</div>
            <div class="booking_meta">
              Lalitpur &nbsp;·&nbsp; Cricket<br/>
              April 20, 2026 &nbsp;·&nbsp; 2:00 PM – 4:00 PM<br/>
              Total: Rs 2,400
            </div>
          </div>
          <div class="booking_right">
            <span class="badge badge_green">Confirmed</span>
          </div>
        </div>

        <div class="booking_item" data-status="cancelled">
          <div>
            <div class="booking_name">Bhaktapur Sports Court</div>
            <div class="booking_meta">
              Bhaktapur &nbsp;·&nbsp; Basketball<br/>
              April 10, 2026 &nbsp;·&nbsp; 4:00 PM – 6:00 PM<br/>
              Total: Rs 1,200
            </div>
          </div>
          <div class="booking_right">
            <span class="badge badge_red">Cancelled</span>
          </div>
        </div>

        <div class="booking_item" data-status="confirmed">
          <div>
            <div class="booking_name">City Football Arena</div>
            <div class="booking_meta">
              Kathmandu &nbsp;·&nbsp; Football<br/>
              April 5, 2026 &nbsp;·&nbsp; 7:00 PM – 9:00 PM<br/>
              Total: Rs 1,600
            </div>
          </div>
          <div class="booking_right">
            <span class="badge badge_green">Confirmed</span>
          </div>
        </div>

      </div>

    </main>
  </div>

  <script>
    function filterBookings(status) {
      var items = document.querySelectorAll("#bookingsList .booking_item");
      items.forEach(function(item) {
        if (status === 'all' || item.dataset.status === status) {
          item.style.display = "flex";
        } else {
          item.style.display = "none";
        }
      });
      var buttons = document.querySelectorAll(".filter_tabs .btn");
      buttons.forEach(function(btn) {
        btn.style.opacity = "0.6";
      });
      event.target.style.opacity = "1";
    }
  </script>

</body>
</html>