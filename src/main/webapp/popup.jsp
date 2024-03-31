<!-- popup.jsp -->
<style>
    :root {
        --main-colour: #2596be;
        --lighter-colour: #36bbeb;
        --darker-colour: #1f7999;
        --lightest-colour: #c0e1ed;
    }

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
        background-color: var(--lightest-colour);
        padding: 5px;
        margin-left: 450px;
        margin-right: 450px;
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
    document.addEventListener("DOMContentLoaded", function() {
        // Check if the message exists and if the popup element is present in the DOM
        var popup = document.getElementById("popup-message");
        if (popup) {
            popup.style.display = 'block'; // Show the popup

            // Close the popup after a delay (e.g., 2000 milliseconds)
            setTimeout(function() {
                closePopup();
            }, 2000);
        }
    });

    // Function to close the popup
    function closePopup() {
        var popup = document.getElementById("popup-message");
        if (popup) {
            popup.style.display = 'none';
        }
    }
</script>

