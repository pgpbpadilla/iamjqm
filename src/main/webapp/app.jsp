<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>AT&amp;T Sample Application - In App Messaging From Mobile Number</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>listview demo</title>
  <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.css">
  <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
  <script src="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.js"></script>
  
  <script type="text/javascript">
      
    var list= [];

    <c:forEach items="${list}" var="item" varStatus="status"> 
        var curString= '${item}';
        list.push(curString);
    </c:forEach> 
      
  </script>
</head>
<body>

  <div data-role="page" id="methods">
    <ul data-role="listview" id="methods-list">
      <li><a href="#">Adam Kinkaid</a></li>
      <li><a href="#">Alex Wickerham</a></li>
      <li><a href="#">Avery Johnson</a></li>
      <li><a href="#">Bob Cabot</a></li>
      <li><a href="#">Caleb Booth</a></li>
    </ul> 
  </div>

  <script type="text/javascript">

  $(document).ready(function(){

    $('#methods-list li').click(function(){

      $(this).append('<ul><li>Test</li></ul>').parent().listview('refresh');

    });
  });
  </script>      

</body>
</html>
