<!DOCTYPE html>
<html>
    <head>
        <title>Page Title</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css" />
        <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
    </head>
    <body>

        <div data-role="page">

            <div data-role="header">
                <h1>jQuery In App Messaging Demo</h1>
            </div><!-- /header -->

            <div data-role="content">
                <form action="app">
                    <input type="button"
                           data-role="button" 
                           value="jQuery In App Messaging Demo"/>
                </form>
            </div><!-- /content -->

        </div><!-- /page -->

        <script type="text/javascript">
            $('input').click(function(){
                window.location.href= window.location.href + '/app' ;
            });
        </script>
    </body>
</html>