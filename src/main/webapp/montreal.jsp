 <!DOCTYPE html>
 <html lang="en">
 <head>
     <meta charset="UTF-8">
     <title>Montreal Hotels</title>
     <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
     <style>
         body {
             font-family: 'Poppins', sans-serif;
             background-color: #f4f4f4;
             margin: 0;
             padding: 0;
             box-sizing: border-box;
             display: flex;
             flex-direction: column;
         }

         /* Main container for filters and hotels */
         .content-container {
             display: flex;
             flex: 1;
         }

         /* Styles for the filters */
         .filters-container {
             padding: 20px;
             flex: 0 0 200px; /* Fixed width for filters */
         }

         .filter-title {
             font-size: 24px;
             margin-bottom: 10px;
         }

         .filter-list {
             display: flex;
             flex-direction: column;
             gap: 10px;
         }

         .filter-item {
             padding: 10px;
             background-color: #f9f9f9;
             border-radius: 8px;
             cursor: pointer;
         }

         .filter-item:hover {
             background-color: #eaeaea;
         }

         /* Styles for the hotels */
         .hotels-container {
             flex: 1; /* Fill remaining space */
             display: flex;
             flex-wrap: wrap;
             padding: 20px;
             gap: 20px;
             justify-content: flex-start;
             align-items: flex-start;
         }

         .hotel-card {
             width: calc(33.333% - 20px);
             box-shadow: 0 4px 8px rgba(0,0,0,0.1);
             border-radius: 8px;
             overflow: hidden;
             transition: transform 0.2s ease, box-shadow 0.2s ease;
         }

         .hotel-card:hover {
             transform: translateY(-5px);
             box-shadow: 0 6px 12px rgba(0,0,0,0.2);
         }

         .hotel-link {
             display: block;
             text-decoration: none;
         }

         .hotel-image {
             width: 100%;
             height: auto;
             border-bottom: 4px solid #fff;
             transition: transform 0.3s ease;
         }

         .hotel-image:hover {
             transform: scale(1.1);
         }

         .hotel-name {
             display: block;
             text-align: center;
             padding: 15px 0;
             background-color: #f29602;
             color: white;
             font-size: 18px;
         }

         /* Styles for the filter dropdowns */
         .filter-dropdown {
             width: 100%;
             padding: 5px;
             border: 1px solid #ccc;
             border-radius: 4px;
             background-color: white;
             cursor: pointer;
         }

     </style>
 </head>
 <body>

<jsp:include page="navbar.jsp" />


<div class="content-container">

<div class="filters-container">
    <h2 class="filter-title">Filters</h2>
    <div class="filter-list">
        <div class="filter-item">
            <label for="start-date-filter">Start Date:</label>
            <input type="date" id="start-date-filter">
        </div>
        <div class="filter-item">
            <label for="end-date-filter">End Date:</label>
            <input type="date" id="end-date-filter">
        </div>
        <div class="filter-item">
            <label for="capacity-filter">Capacity:</label>
            <select id="capacity-filter" class="filter-dropdown">
                <option value=""></option>
                <option value="single">Single</option>
                <option value="double">Double</option>
                <option value="suite">Suite</option>
            </select>
        </div>
        <div class="filter-item">
            <label for="area-filter">Area:</label>
            <select id="area-filter" class="filter-dropdown">
                <option value=""></option>
                <option value="downtown">Downtown</option>
                <option value="suburb">Suburb</option>
            </select>
        </div>
        <div class="filter-item">
            <label for="hotel-chain-filter">Hotel Chain:</label>
            <select id="hotel-chain-filter" class="filter-dropdown">
                <option value=""></option>
                <option value="chain1">Chain 1</option>
                <option value="chain2">Chain 2</option>
            </select>
        </div>
        <div class="filter-item">
            <label for="hotel-category-filter">Hotel Category:</label>
            <select id="hotel-category-filter" class="filter-dropdown">
                <option value=""></option>
                <option value="budget">Budget</option>
                <option value="mid-range">Mid-Range</option>
                <option value="luxury">Luxury</option>
            </select>
        </div>
        <div class="filter-item">
            <label for="total-rooms-filter">Total Rooms:</label>
            <input type="number" id="total-rooms-filter">
        </div>
        <div class="filter-item">
            <label for="price-filter">Price:</label>
            <select id="price-filter" class="filter-dropdown">
                <option value=""></option>
                <option value="Under $75">Under $75</option>
                <option value="$75-$200">$75-$200</option>
                <option value="Over $200">Over $200</option>
            </select>
        </div>
        <div class="filter-item">
            <button id="search-button">Search</button>
        </div>
    </div>
</div>

<div class="hotels-container">
    <div class="hotel-card">
        <a href="payment.jsp" class="hotel-link">
        <img src="https://via.placeholder.com/150" alt="Hotel 1" class="hotel-image">
        <span class="hotel-name">Room 1</span>
        </a>
    </div>
    <div class="hotel-card">
        <a href="hotel-details.jsp?id=2" class="hotel-link">
            <img src="https://via.placeholder.com/150" alt="Hotel 2" class="hotel-image">
            <span class="hotel-name">Room 2</span>
        </a>
    </div>
    <div class="hotel-card">
        <a href="hotel-details.jsp?id=3" class="hotel-link">
            <img src="https://via.placeholder.com/150" alt="Hotel 3" class="hotel-image">
            <span class="hotel-name">Room 3</span>
        </a>
    </div>
    <!-- Add more hotel cards here -->
</div>

</body>
</html>
