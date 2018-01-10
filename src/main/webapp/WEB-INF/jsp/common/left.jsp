<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/>
<script type="text/javascript" src="${ctxStatic}/js/prefixfree.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/index_styles.css">
<ul class="drawer" style="width:5%;">
	  <li>
	    <a href="#">
	      <i class="fa fa-info-circle"></i>
	      <span>Info</span>
	    </a>
	    <ul>
	      <li>
	        <a href="#" target="_blank">
	          <i class="fa fa-folder-open"></i>
	          <span>Portfolio</span>
	        </a>
	      </li>
	      <li>
	        <a href="#" target="_blank">
	          <i class="fa fa-question-circle"></i>
	          <span>About</span>
	        </a>
	      </li>
	      <li>
	        <a href="http://www.jq22.com/" target="_blank">
	          <i class="fa fa-phone-square"></i>
	          <span>Contact</span>
	        </a>
	      </li>
	    </ul>
	  </li>
	  <li>
	    <a href="#">
	      <i class="fa fa-folder"></i>
	      <span>Projects</span>
	    </a>
	    <ul>
	      <li>
	        <a href="#" target="_blank">
	          <i class="fa fa-flash"></i>
	          <span>Hover.css</span>
	        </a>
	      </li>
	      <li>
	        <a href="#" target="_blank">
	          <i class="fa fa-ellipsis-h"></i>
	          <span>Sequence.js</span>
	        </a>
	      </li>
	      <li>
	        <a href="#" target="_blank">
	          <i class="fa fa-dot-circle-o"></i>
	          <span>jQuery Parallax</span>
	        </a>
	      </li>
	    </ul>
	  </li>
	  <li>
	    <a href="#">
	      <i class="fa fa-share-alt"></i>
	      <span>Social</span>
	    </a>
	    <ul>
	      <li>
	        <a href="#" target="_blank">
	          <i class="fa fa-codepen"></i>
	          <span>CodePen</span>
	        </a>
	      </li>
	      <li>
	        <a href="#" target="_blank">
	          <i class="fa fa-twitter"></i>
	          <span>Twitter</span>
	        </a>
	      </li>
	      <li>
	        <a href="#" target="_blank">
	          <i class="fa fa-github"></i>
	          <span>GitHub</span>
	        </a>
	      </li>
	      <li>
	        <a href="#" target="_blank">
	          <i class="fa fa-globe"></i>
	          <span>Web</span>
	        </a>
	      </li>
	    </ul>
	  </li>
	</ul>