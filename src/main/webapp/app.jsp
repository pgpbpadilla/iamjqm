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

    <c:forEach var="msg" items="${list.messages}"> 
        var messageId= '${msg.messageId}';
        list.push(messageId);
    </c:forEach> 
      
  </script>
</head>
<body>

  <div data-role="page" id="methods">
    <ul data-role="listview" id="methods-list">
      <li><a href="#">Get Message list</a></li>
    </ul> 
  </div>

  <script type="text/javascript">

  $(document).ready(function(){

    $('#methods-list li').click(function(){

      if(list){
          // append a ul to this li
          var ul= $('<ul>');
          $(this).append(ul);

          // append the children based on the contents of `list`
          $(list).each(function(item, value){
              $(ul).append('<li>'+ value + '</li>');
          });
          // update CSS
          $(this).parent().listview('refresh');
      }
    });
  });
  </script>      

</body>
</html>
