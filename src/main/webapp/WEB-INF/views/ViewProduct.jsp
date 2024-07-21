<%@page import="com.bean.EProductBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Product</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.gallery-wrap .img-big-wrap img {
    height: 450px;
    width: auto;
    display: inline-block;
    cursor: zoom-in;
}
.gallery-wrap .img-small-wrap .item-gallery {
    width: 60px;
    height: 60px;
    border: 1px solid #ddd;
    margin: 7px 2px;
    display: inline-block;
    overflow: hidden;
}
.gallery-wrap .img-small-wrap {
    text-align: center;
}
.gallery-wrap .img-small-wrap img {
    max-width: 100%;
    max-height: 100%;
    object-fit: cover;
    border-radius: 4px;
    cursor: zoom-in;
}
</style>
</head>
<body>
	<br>
	<h2 align="center">View Product</h2>
	
	<%
		EProductBean products = (EProductBean) request.getAttribute("product");
		{
	%>
	
	<div class="container">
	<br>
	<hr>

	<div class="card">
		<div class="row">
			<aside class="col-sm-5 border-right">
				<article class="gallery-wrap">
					<div class="img-big-wrap">
						<div>
						<img src="<%= products.getProductImagePath() %>" alt="Product Image" height="100%" width="100%"></div>
					</div> <!-- slider-product.// -->
				</article> <!-- gallery-wrap .end// -->
			</aside>
			<aside class="col-sm-7">
				<article class="card-body p-5">
					<h3 class="title mb-3"><%= products.getProductName() %></h3>
					<p class="price-detail-wrap">
						<span class="price h3 text-warning">
							<span class="currency">Price : </span><span class="num"><%= products.getPrice() %></span>
						</span>
						
					</p> <!-- price-detail-wrap .// -->
					<dl class="item-property">
						<dt>Description</dt>
						<dd><p>Description of the product.</p></dd>
					</dl>
					<dl class="param param-feature">
						<dt>Category</dt>
						<dd><%= products.getCategory() %></dd>
					</dl>  <!-- item-property-hor .// -->
					<dl class="param param-feature">
						<dt>Quantity</dt>
						<dd><%= products.getQty() %></dd>
					</dl>  <!-- item-property-hor .// -->
					
					<hr>
					
					<hr>
					<a href="#" class="btn btn-lg btn-primary text-uppercase"> Buy now </a>
					<a href="addtocart?productId=<%=products.getProductId()%>" class="btn btn-lg btn-outline-primary text-uppercase"> <i class="fas fa-shopping-cart"></i> Add to cart </a>
				</article> <!-- card-body.// -->
			</aside> <!-- col.// -->
		</div> <!-- row.// -->
	</div> <!-- card.// -->
</div>
<!--container.//-->
<%
		} 
%>
	
<br><br><br>

</body>
</html>
