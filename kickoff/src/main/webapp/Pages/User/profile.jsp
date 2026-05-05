<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile – KickOff</title>
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=DM+Sans:wght@400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/userdashboard.css"/>
  <style>
    .profile_avatar {
      width: 80px; height: 80px;
      min-width: 80px; min-height: 80px;
      border-radius: 50%;
      background: #2a6fdb;
      color: #fff;
      font-size: 28px; font-weight: 600;
      display: flex; align-items: center; justify-content: center;
      flex-shrink: 0; overflow: hidden;
      border: 3px solid #2a6fdb;
    }
    .profile_avatar_img {
      width: 80px; height: 80px;
      min-width: 80px; min-height: 80px;
      object-fit: cover; object-position: top; display: block;
    }
    .msg_success {
      background: rgba(39,174,96,0.15);
      border: 1px solid #27ae60;
      color: #27ae60;
      padding: 12px 16px;
      border-radius: 8px;
      margin-bottom: 16px;
      font-size: 14px;
    }
    .msg_error {
      background: rgba(231,76,60,0.15);
      border: 1px solid #e74c3c;
      color: #e74c3c;
      padding: 12px 16px;
      border-radius: 8px;
      margin-bottom: 16px;
      font-size: 14px;
    }
  </style>
</head>
<body>
