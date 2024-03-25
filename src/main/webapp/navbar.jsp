<!-- navbar.jsp -->
<style>
         body {
                font-family: 'Poppins', sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
        }
        .navbar {
            background-color: #f29602; /* background color for navbar (FFAF45) (0056b3) (f29602)*/
            overflow: hidden;
            padding: 0 20px;
        }
        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 16px 16px;
            text-decoration: none;
            transition: background-color 0.3s, text-shadow 0.3s;
            border-radius: 16px; /* Rounded edges for the container */
        }
        .navbar a:hover {
            background-color: #FFAF45; /* Lighter orange on hover */
            /*padding: 12px 12px; /* reduced padding on hover */
            /*margin: 4px 4px; /* adjusted margin to compensate for the reduced padding */

            text-shadow: 0 0 0 2px #FFAF45;

        }
        .navbar .profile {
            float: right;
        }
        .navbar .logo {
            font-size: 20px;
            font-weight: 600;
            padding: 14px 16px;
            color: white;
            text-decoration: none;
            float: left;
        }

        /* Override the hover effect for the logo specifically */
        .navbar .logo:hover {
            background-color: transparent; /* Maintain the background color on hover */
            color: white; /* Maintain the text color on hover */
            box-shadow: none;
            text-shadow: none:
        }

         /* Profile dropdown styling */
        .profile-dropdown {
            /*position: relative; /* This positions the dropdown absolutely within the navigation link */
            float: right;
            overflow: hidden; /* Ensures the dropdown content is hidden until hovered */
        }

        /* Dropdown content container */
        .dropdown-content {
            display: none; /* Hide dropdown content */
            position: absolute; /* Positioning dropdown */
            background-color: #f9f9f9; /* Dropdown background color */
            width: 80px; /* Ensure dropdown is as wide as the parent */
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); /* Add some shadow */
            z-index: 1; /* Ensure dropdown is on top */
            top: 58px; /* Start just below the profile link */
            /*left: 0; /* Align with the left edge of the profile link */
            border-radius: 14px;
        }

        /* Style dropdown links */
        .dropdown-content a {
            float: none; /* Dropdown links should not float */
            color: black; /* Text color */
            padding: 12px 12px; /* Padding for dropdown items */
            text-decoration: none; /* No underline */
            display: block; /* Dropdown items should be block level for easier interaction */
            text-align: center; /* Align text to the left */
            font-size: 14px;
        }

        /* Show dropdown content on hover */
        .profile-dropdown:hover .dropdown-content {
            display: block; /* Show dropdown content */
        }

        /* Change dropdown links style on hover */
        .dropdown-content a:hover {
            background-color: #FFAF45; /* Light grey background on hover */
        }

 </style>

 <div class="navbar">
     <a href="/my-hotels" class="logo">myHotels</a>
     <a href="#stays">Stays</a>
     <a href="bookings.jsp">Bookings</a>
     <a href="#about">About</a>
     <a href="#contact">Contact</a>
     <div class="profile-dropdown">
             <a href="#profile" class="profile">Profile</a>
             <div class="dropdown-content">
                 <a href="signup.jsp">Sign In</a>
                 <a href="register.jsp">Register</a>
             </div>
         </div>
 </div>
