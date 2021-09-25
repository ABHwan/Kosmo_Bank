<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<!-- Start of UiPath Chatbot widget -->
<script>
  window.addEventListener("message", function (event) {
      if (event.data.hasOwnProperty("frameSize")) {
          const size = event.data.frameSize;
          document.getElementById("uipath-chatbot-iframe").style.height = size.height;
          document.getElementById("uipath-chatbot-iframe").style.width = size.width;
      }
  });
</script>

<iframe src="https://chatbot.uipath.com/web-channel?connectionId=90de01da-0cf3-4af5-8030-1224b44e91d6"
  id="uipath-chatbot-iframe"
  style="
      z-index: 9999;
      position: fixed;
      bottom: 0;
      right: 0;
      height: 112px;
      width: 120px;
      border: 0;">
</iframe>
<!-- End of UiPath Chatbot widget -->
</body>
</html>