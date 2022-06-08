<#macro page>
    <!DOCTYPE HTML>
    <html lang="en">
    <head>
        <title>kotiki</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <link href="../css/style.css" rel="stylesheet">
    </head>
    <body>
    <div class="container mt-2">
        <#nested>
    </div>
    </body>
    </html>
</#macro>