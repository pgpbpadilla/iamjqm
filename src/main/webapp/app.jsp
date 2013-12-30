<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>AT&amp;T Sample Application - In App Messaging From Mobile Number</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>IAM + jQuery Mobile Demo</title>

        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.css">
        <link rel="stylesheet" href="css/default.css">

        <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.js"></script>
        <script src="js/libs/date.js"></script>

        <script type="text/javascript">

            var list = [];

            <c:forEach var="msg" items="${list.messages}">
            var message = {};
            message.id = '${msg.messageId}';
            message.from = '${msg.from}';

                <c:set var="text" value="${msg.text}" />
                <c:set var="search" value="'" />
                <c:set var="replace" value="%27" />
            message.text = '${fn:replace(text, search, replace)}';

            message.date = Date.parse('${msg.timeStamp}');

            list.push(message);
            </c:forEach>

        </script>
    </head>
    <body>

        <div data-role="page" id="methods" data-add-back-btn="false">
            <div data-role="header">
                <h1>jQuery In App Messaging Demo</h1>
            </div><!-- /header -->
            <div data-role="content">
                <ul data-role="listview" id="methods-list">
                    <li><a href="#">Get Message list</a></li>
                </ul> 
            </div>
            <div data-role="popup" id="popupBasic" class="dialog">
                <h3>Delete message?</h3>
                <a data-role="button" href="#" 
                   class="deleteMessage">Delete</a>
                <a data-role="button" href="#" 
                   class="cancelDelete">Cancel</a>
            </div>
        </div>

        <script type="text/javascript">

            $(document).bind("mobileinit", function() {
                $.mobile.page.prototype.options.addBackBtn = true;
            });
            $(document).ready(function() {

                $('#methods-list li').click(function() {

                    if (undefined !== list) {

                        // append a ul to this li
                        var ul = $('<ul id="messages" data-split-icon="delete">');
                        $(this).append(ul);

                        // append the children based on the contents of `list`
                        $(list).each(function(item, message) {
                            $(ul).append('<li><span class="id" style="display:none">'
                                    + message.id + '</span>'
                                    + '<a href="#popupBasic" data-rel="popup">'
                                    + '<h3>' + message.from + '</h3>'
                                    + '<p>' + message.text.replace('%27', '\'') + '</p>'
                                    + '<p class="ui-li-aside"><strong>'
                                    + message.date.toUTCString().substr(0, 22)
                                    + '</strong>PM</p>'
                                    + '</a>'
                                    + '<a href="#" class="delete">Delete</a>'
                                    + '</li>');
                        });

                        $('.delete').on('click', function() {

                            // copy popup to nested list view
                            var nestedLiPage = $(".ui-page-active");
                            var popup = $('#popupBasic').clone().appendTo(nestedLiPage).popup().popup('open');

                            var curItem = $(this).parents('li');
                            popup.find('.deleteMessage').click(function() {
                                // remove element from listview
                                $(curItem).remove();
                                // refresh the listview
                                $(curItem).parent().listview('refresh');
                                // close the dialog
                                popup.popup('close');
                            });

                            popup.find('.cancelDelete').click(function() {
                                // close the dialog
                                popup.popup('close');
                            });
                        });

                        // update CSS
                        $(this).parent().listview('refresh');
                    }
                });
            });
        </script>      

    </body>
</html>
