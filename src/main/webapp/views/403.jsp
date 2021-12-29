<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>403</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="">
  <style>
      * {
          -webkit-box-sizing: border-box;
          box-sizing: border-box;
      }

      body {
          padding: 0;
          margin: 0;
      }

      #notfound {
          position: relative;
          height: 100vh;
      }

      #notfound .notfound {
          position: absolute;
          left: 50%;
          top: 50%;
          -webkit-transform: translate(-50%, -50%);
          -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
      }

      .notfound {
          max-width: 520px;
          width: 100%;
          line-height: 1.4;
          text-align: center;
      }

      .notfound .notfound-403 {
          position: relative;
          height: 240px;
      }

      .notfound .notfound-403 h1 {
          font-family: 'Montserrat', sans-serif;
          position: absolute;
          left: 50%;
          top: 50%;
          -webkit-transform: translate(-50%, -50%);
          -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
          font-size: 200px;
          font-weight: 900;
          margin: 0px;
          color: #262626;
          text-transform: uppercase;
          letter-spacing: -40px;
          margin-left: -20px;
      }

      .notfound .notfound-403 h1>span {
          text-shadow: -8px 0px 0px #fff;
      }

      .notfound .notfound-403 h3 {
          font-family: 'Cabin', sans-serif;
          position: relative;
          top: 10rem;
          font-size: 16px;
          font-weight: 700;
          text-transform: uppercase;
          color: #262626;
          margin: 0px;
          letter-spacing: 3px;
          padding-left: 6px;
      }

      .notfound h2 {
          font-family: 'Cabin', sans-serif;
          font-size: 36px;
          font-weight: 400;
          text-transform: uppercase;
          color: #000;
          margin-top: 0px;
          margin-bottom: 25px;
      }
  </style>
</head>
<body>
  <div id="notfound">
    <div class="notfound">
      <div class="notfound-403">
        <h2>ACCESS FORBIDDEN</h2>
        <h1><span>4</span><span>0</span><span>3</span></h1>
        <h3>You don't have permission to view this page!</h3>
      </div>

      <div class="mt-5">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/Home" role="button">
          <i class="fa fa-home" aria-hidden="true"></i>
          Home
        </a>
        <a class="btn btn-success" href="#" role="button">
          <i class="fa fa-envelope" aria-hidden="true"></i>
          Contact Support
        </a>
      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
          integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
          crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
          integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
          crossorigin="anonymous"></script>
</body>
</html>