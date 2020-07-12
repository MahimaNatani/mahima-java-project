
<jsp:useBean id="c1" class="beans.Category"></jsp:useBean>
<jsp:useBean id="s1" class="beans.SubCategory"></jsp:useBean>
<jsp:useBean id="p" class="beans.Product"></jsp:useBean>

	<div class="col-sm-3">
		<div class="left-sidebar">
			<h2>Category</h2>
				<div class="panel-group category-products" id="accordian"><!--category-productsr-->
<%
						String catData[][]=c1.getAllRecords();
						for(int i=0;i<catData.length;i++){
%>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#<%=catData[i][1]%>">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											<%=catData[i][1] %>
										</a>
									</h4>
								</div>
								<div id="<%=catData[i][1] %>" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
<%
										String subCatData[][]=s1.getAllSubCategoryByCatId(Integer.parseInt(catData[i][0]));
										for(int j=0;j<subCatData.length;j++){								
%>
										
											<li><a href="index.jsp?subcatid=<%=subCatData[j][0]%>"><%=subCatData[j][1] %> </a></li>
<%							
										}
%>					
											
										</ul>
									</div>
								</div>
							</div>
<%
						}
%>
							
						</div><!--/category-products-->
					
						<div class="brands_products"><!--brands_products-->
							<h2>Brands</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
<%
								String brandData[][]=p.getBrands();
								for(int i=0;i<brandData.length;i++){
%>
									<li><a href="index.jsp?brandid=<%=brandData[i][0]%>"> <span class="pull-right">(50)</span><%=brandData[i][1]%></a></li>
<%
								}
%>								
								</ul>
							</div>
						</div><!--/brands_products-->
						
						<div class="price-range"><!--price-range-->
							<h2>Price Range</h2>
							<div class="well text-center">
								 <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
								 <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
							</div>
						</div><!--/price-range-->
						
						<div class="shipping text-center"><!--shipping-->
							<img src="images/home/shipping.jpg" alt="" />
						</div><!--/shipping-->
					
		</div>
	</div>