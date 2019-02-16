<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Coming Soon - Application Template</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/coming-soon.min.css" rel="stylesheet">

  </head>

  <body>

    <div class="overlay"></div>

    <div class="masthead">
      <div class="masthead-bg"></div>
      <div class="container h-100">
        <div class="row h-100">
          <div class="col-12 my-auto">
            <div class="masthead-content text-white py-5 py-md-0">
              <h1 class="mb-3">Coming Soon!</h1>
              <p class="mb-5">We're working hard to finish the development of this site. Our target launch date is <strong>August 2018</strong>! Sign up for updates using the form below!</p>
                <div id="divAlertMsg" class="alert alert-primary d-none" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <b id="lblAlertMsg"></b>
                    <a href="#" onclick="location.reload();">
                    <i class="fa fa-refresh"></i></a>
                </div>

                <div id="divSubscriberForm">
                    <!--email section-->
                    <label>Sign Up for Launch Updates</label>
                    <div class="form-inline">
                        <label class="sr-only" for="emailAddress">Email Address</label>
                        <input type="email" class="form-control mb-2 mr-sm-2" name="emailAddress" id="emailAddress" placeholder="Example@email.com" required>
                        <a href="#" id="SignUp" name="SignUp" class="btn btn-outline-primary mb-2" onclick="if(doValidation(this.id)) $(this).addClass('d-none');">Submit</a>
                        <a href="#" id="Clear" name="Clear" class="btn btn-outline-danger mb-2 d-none" onclick="if(doValidation(this.id)) $(this).addClass('d-none');">Clear</a>
                    </div>
                    <!--validate against bot-->
                    <div id="divBotValidator" class="d-none">
                        <label for="form_message">What is <span id="lblA1"></span> + <span id="lblA2"></span>?</label>
                        <div class="form-inline">
                            <input id="validationQuestion" type="number" class="form-control mb-2 mr-sm-2" placeholder="Prove you're not a robot *" required>

                            <a href="#" id="Validate" name="Validate" class="btn btn-outline-primary mb-2" onclick="doValidation(this.id)">Verify</a>
                        </div>
                    </div>
                </div>
              <!--<div class="input-group input-group-newsletter">
                <input type="email" class="form-control" placeholder="Enter email..." aria-label="Search for...">
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button">Notify Me!</button>
                </span>
              </div>-->
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="social-icons">
      <ul class="list-unstyled text-center mb-0">
        <li class="list-unstyled-item">
          <a href="#">
            <i class="fa fa-twitter"></i>
          </a>
        </li>
        <li class="list-unstyled-item">
          <a href="#">
            <i class="fa fa-facebook"></i>
          </a>
        </li>
        <li class="list-unstyled-item">
          <a href="#">
            <i class="fa fa-instagram"></i>
          </a>
        </li>
      </ul>
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/vide/jquery.vide.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/coming-soon.min.js"></script>
    <script>
        //Document Ready Function for page
        $( document ).ready(function() {
            //generate random numbers for form validation
            randomnum1 = Math.floor((Math.random() * 10) + 1);
            randomnum2 = Math.floor((Math.random() * 10) + 1);
            $("#lblA1").text(randomnum1);   //assign numbers to labels
            $("#lblA2").text(randomnum2);

            $("#emailAddress").on('keyup', function (e) {
                //if user hits enter on email sign up input
                if (e.keyCode == 13) {
                    //enter key
                    doValidation("SignUp");
                }
            });
            $("#validationQuestion").on('keyup', function (e) {
                //if user hits enter on validation question
                if (e.keyCode == 13) {
                    doValidation("Validate");
                }
            });
        });

        function validateEmail(email) {
            //checks if email input is valid format
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email.toLowerCase());
        }

        function doValidation(cmd){
            cmd = cmd.toUpperCase();
            switch (cmd){
                case "SIGNUP":
                    var emailaddress = $("#emailAddress").val();

                    if(emailaddress.length > 0){
                        if(validateEmail(emailaddress)){
                            //valid email address was entered
                            $("#SignUp").addClass("d-none");
                            $("#Clear").removeClass("d-none");
                            $("#emailAddress").addClass("is-valid");
                            $("#emailAddress").prop("disabled", true);  //disable email so we have this email value locked in
                            $('#divBotValidator').removeClass('d-none');    //show random number validation question
                        }
                        else{
                            $("#emailAddress").addClass("is-invalid");
                            return false;
                        }
                    }
                    else{
                        $("#emailAddress").addClass("is-invalid");
                        return false;
                    }
                    return true;
                case "VALIDATE":
                    var validationAnswer = $("#validationQuestion").val();  //capture solution entered by user
                    var validationSolution = randomnum1 + randomnum2;       //calculate solution by random generated numbers
                    if(validationAnswer == validationSolution){
                        //solution entered by user was correct
                        $("#divSubscriberForm").addClass("d-none"); //remove subscriber form

                        //call AJAX function to add subscriber to db
                        addSubscriber($("#emailAddress").val());

                        return true;
                    }
                    $("#validationQuestion").addClass("is-invalid");
                    return false;
                case "CLEAR":
                    //provides a way for the user to clear and re-enter email
                    $("#emailAddress").val(''); //clear email value
                    $("#SignUp").removeClass("d-none"); //show
                    $("#Clear").addClass("d-none");     //hide
                    $("#emailAddress").removeClass("is-valid");
                    $("#emailAddress").prop("disabled", false);  //enable email field
                    $('#divBotValidator').addClass('d-none');    //hide random number validation
                    return true;
            }

        }
        function addSubscriber(email){
            $.ajax({
                type: 'POST',
                url: 'AJAX/addSubscriber.php',
                data: {
                    'email': email
                },
                success: function(msg){
                    if(msg === ""){
                        alert("Posting failed.");
                    }
                    else{
                        $("#divAlertMsg").removeClass("d-none");    //show success message
                        $("#lblAlertMsg").html(msg);
                    }

                }
            });
            return false;
        }
        function sendContactEmail(){
            var returnValue = true;
            var name = $("#name").val();
            var email = $("#email").val();
            var phone = $("#phone").val();
            var message = $("#message").val();
            if(name.length > 0){
                $("#name").addClass("is-valid");
            }
            else {
                $("#name").addClass("is-invalid");
                returnValue = false;
            }
            if(email.length > 0){
                $("#message").addClass("is-valid");
            }
            else {
                $("#email").addClass("is-invalid");
                returnValue = false;
            }
            if(message.length > 0){
                $("#message").addClass("is-valid");
            }
            else {
                $("#message").addClass("is-invalid");
                returnValue = false;
            }
            if(returnValue){
                $.ajax({
                    type: 'POST',
                    url: 'sendContactEmail.php',
                    data: {
                        'name': name,
                        'email': email,
                        'phone': phone,
                        'message': message
                    },
                    success: function(msg){
                        if(msg.toUpperCase() === "SUCCESS"){
                            $("#divSuccess").removeClass("d-none");
                            $("#divDanger").addClass("d-none");
                        }
                        else{
                            $("#divSuccess").addClass("d-none");
                            $("#divDanger").removeClass("d-none");
                        }

                    }
                });
            }
            else{
                $("#divDanger").removeClass("d-none");
            }

        }
    </script>
  </body>

</html>
