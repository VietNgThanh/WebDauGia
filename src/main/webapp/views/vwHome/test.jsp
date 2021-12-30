<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/30/2021
  Time: 4:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="sidebar">

    <div class="inner">

        <!-- Search Box -->
        <section id="search" class="alt">
            <form method="get" action="#">
                <input type="text" name="search" id="search" placeholder="Search..." />
            </form>
        </section>

        <!-- Menu -->
        <nav id="menu">
            <ul>
                <li><a href="index.html">Homepage</a></li>
                <li><a href="simple_page.html">Simple Page</a></li>
                <li><a href="shortcodes.html">Shortcodes</a></li>
                <li>
                    <span class="opener">Dropdown One</span>
                    <ul>
                        <li><a href="#">First Sub Menu</a></li>
                        <li><a href="#">Second Sub Menu</a></li>
                        <li><a href="#">Third Sub Menu</a></li>
                    </ul>
                </li>
                <li>
                    <span class="opener">Dropdown Two</span>
                    <ul>
                        <li><a href="#">Sub Menu #1</a></li>
                        <li><a href="#">Sub Menu #2</a></li>
                        <li><a href="#">Sub Menu #3</a></li>
                    </ul>
                </li>
                <li><a href="https://www.google.com">External Link</a></li>
            </ul>
        </nav>
    </div>
</div>
</body>
</html>
