<!-- navbar.jsp -->
<style>
    /*popup window */
    .popup {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: rgba(0, 0, 0, 0.5); /* Dimmed background */

    }

    .popup-content {
        background-color: #fce5b8;
        padding: 5px;
        margin-left: 500px;
        margin-right: 500px;
        margin-top: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        text-align: center;
        font-size: 20px
    }

    .close-btn {
        float: right;
        font-size: 1.5em;
        cursor: pointer;
    }
</style>

<%
String message = (String) session.getAttribute("message");
if(message != null){
    session.removeAttribute("message");
%>
    <div id="popup-message" class="popup" style="display: none;">
        <div class="popup-content">
            <span class="close-btn" onclick="closePopup()">&times;</span>
            <p><%= message %></p>
        </div>
    </div>
<%
}
%>

<script>
    window.onload = function() {
        // Automatically show the popup
        var popup = document.getElementById("popup-message");
        if (popup) {
            popup.style.display = 'block';
        }

        // Automatically close the popup after 1 second
        setTimeout(function() {
            closePopup();
        }, 2000);
    };

    // Function to close the popup
    function closePopup() {
        var popup = document.getElementById("popup-message");
        if (popup) {
            popup.style.display = 'none';
        }
    }
</script>
