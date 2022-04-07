<?php
include_once("./classes/main_database_class.php");
$mdb = new Main_database("jagata","pwd","lands_bot");
$amount = $mdb->amount_to_be_paid();
?>

<!doctype html>
<html lang="en">
   <head>
      <title>Lands bot website</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
      <link rel="stylesheet" href="./templates/css/lands_page.css">
      <link rel="stylesheet" href="./templates/css/lands_page_custom.css">
      <meta name="robots" content="noindex, follow">
   </head>
   <body>
      <div class="wrapper d-flex align-items-stretch">
         <nav id="sidebar">
            <div class="custom-menu">
               <button type="button" id="sidebarCollapse" class="btn btn-primary">
               <i class="fa fa-bars"></i>
               <span class="sr-only">Toggle Menu</span>
               </button>
            </div>
            <div class="p-4 pt-5">
               <h1><a href="#" class="logo">Welcome</a></h1>
               <ul class="list-unstyled components mb-5">
                  <li class="active">
                     <a href="">Home</a>
                  </li>
                  <li>
                     <a href="#About">Myhome posts</a>
                  </li>

                  <li>
                     <a href="#Myhome users">Myhome users</a>
                  </li>
                  <li class="active">
                    <form action="" method="post">
                      <input type="hidden" name="logout">
                      <a onclick="this.parentNode.submit();" href="#Contact">Log out</a>
                    </form>

                  </li>
               </ul>

               <div class="footer">
                  <p>
                     Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                  </p>
               </div>
            </div>
         </nav>
          <div class="home_main">

               <div id="" class="content">
                  <p class="balance">Balance: <i><?php echo $amount; ?></i> GEL</p>
                  <h2 class="mb-4 text-secondary">Search myhome lands.</h2>
                  <p>Enter myhome post id, phone number, name etc.</p>

                  <form class="form-inline">
                    <input class="form-control mr-sm-2 for-border" id="search_text" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-color" id="search" type="submit">Search</button>
                  </form>
                  <div id="alert_message" class="alert alert-primary alert-text" role="alert">
                      You must type some text in search input.
                </div>
               </div>

               <div class="table_class">
                 <table style="display: none;" class="table table-bordered myadd">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">My id</th>
                        <th scope="col">Post id</th>
                        <th scope="col">User</th>
                        <th scope="col">Name</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Post Date</th>
                        <th scope="col">Link</th>
                      </tr>
                    </thead>
                    <tbody>

                    </tbody>
                  </table>
               </div>
          </div>
      </div>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
      <script src="./templates/scripts/main.js"></script>
   </body>
</html>
