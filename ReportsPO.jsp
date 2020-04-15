<%@ page import="Database.Variable_Order"%>
<%@ page import="Database.Variable_Product"%>
<%@ page import="CRUD.Get_Value"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
  <title>Reports</title>
  <link rel = "icon" href = "icon.png" type = "image/x-icon">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel = "stylesheet" type = "text/css" href = "/IMS/CSS/Reports.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
  <script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>


<meta charset="ISO-8859-1">
	<script src="jspdf.js"></script>
	<script src="jquery-2.1.3.js"></script>
	<script src="pdfFromHTML.js"></script>
	<script src="pdfFromHTML2.js"></script>
	<script src="pdfFromHTML3.js"></script>
		
</head>

<body>
<div class="navbar">
  <div class="heading">
    <a href="/IMS/DASHBOARD/DashboardPO.jsp">ORDER<br/>TRACKING<br/>SYSTEM</a>
  </div>
  <ul>
    <li class="unactive">
      <a href="/IMS/DASHBOARD/DashboardPO.jsp">
      <div class="icon">
        <i class="fa fa-tachometer" aria-hidden="true"></i>
      </div>
      <div class="name" data-text="Dashboard">Dashboard</div>
      </a>
    </li>

    <li class="unactive">
      <a href="/IMS/PURCHASING/PurchasingPO.jsp">
      <div class="icon">
        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
      </div>
      <div class="name" data-text="Purchasing">Purchasing</div>
      </a>
    </li>

    <li class="unactive">
      <div class="dropdown">
        <button onclick="myFunction()" class="dropbtn">
          <div class="icon">
            <i class="fa fa-cubes" aria-hidden="true"></i>
          </div>
          <div class="name" data-text="Inventory">Inventory <i class="fa fa-angle-down" aria-hidden="true" font-size="14"></i></div>
        </button>
        <div id="myDropdown" class="dropdown-content">
          <a href="/IMS/INVENTORY/BrandPO.jsp">Brand</a>
          <a href="/IMS/INVENTORY/CategoryPO.jsp">Category</a>
          <a href="/IMS/INVENTORY/ProductPO.jsp">Product</a>
        </div>
      </div>
    </li>

    <li class="unactive">
      <a href="/IMS/QUALITYCONTROL/QCGPO.jsp">
      <div class="icon">
        <i class="fa fa-check-square-o" aria-hidden="true"></i>
      </div>
      <div class="name" data-text="Quality Control">Quality Control</div>
      </a>
    </li>

    <li class="unactive">
      <a href="/IMS/DELIVERY/DeliveryPO.jsp">
      <div class="icon">
        <i class="fa fa-truck" aria-hidden="true"></i>
      </div>
      <div class="name" data-text="Delivery">Delivery</div>
      </a>
    </li>

    <li class="active">
      <a href="#">
      <div class="icon">
        <i class="fa fa-line-chart" aria-hidden="true"></i>
      </div>
      <div class="name" data-text="Reports">Reports</div>
      </a>
    </li>

    <li class="unactive">
      <div class="dropdown">
        <button onclick="myFunction()" class="dropbtn">
          <div class="icon">
            <i class="fa fa-cog" aria-hidden="true"></i>
          </div>
          <div class="name" data-text="Settings">Settings <i class="fa fa-angle-down" aria-hidden="true" font-size="14"></i></div>
        </button>
        <div id="myDropdown" class="dropdown-content">
          <a href="/IMS/ACCOUNT/AccountsPO.jsp"><i class="fa fa-user" aria-hidden="true" font-size="14"></i>&nbsp;&nbsp;&nbsp;&nbsp;Account</a>
          <a href="/IMS/Login.jsp"><i class="fa fa-sign-out" aria-hidden="true" font-size="14"></i>&nbsp;&nbsp;&nbsp;&nbsp;Logout</a>
        </div>
      </div>
    </li>
  </ul>
</div>


<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>

  <div class="search">
    <a class="modalb" href="/IMS/REPORTS/Reports.jsp" onclick="HTMLtoPDF()">Download PDF</a>
  </div>

<div class="mainframe">
    <h2>Delivered</h2>
<div class="ex1" >
 <table cellspacing="0" cellpadding="0" border="0">
  <tr>
    <td>
       <div style="width:1050px; height:260px; overflow:auto;" id="HTMLtoPDF">
       
         <table cellspacing="0" cellpadding="3" width="1050" class="eto">
         
      <tr>
        <th onclick="sortTable(0)" style="width: 12.67%">Order #</th>
        <th onclick="sortTable(1)" style="width: 16.67%">Date</th>
        <th onclick="sortTable(2)" style="width: 16.67%">Client</th>
        <th onclick="sortTable(3)" style="width: 20.67%">Contact</th>
        <th onclick="sortTable(4)" style="width: 16.67%">Location</th>
        <th onclick="sortTable(5)" style="width: 16.67%">In-Charge</th>
      </tr>
         
<%

Get_Value obj_Get_Value = new Get_Value();

List<Variable_Order> list = obj_Get_Value.Delivered();

Iterator<Variable_Order> it_list = list.iterator();

while (it_list.hasNext()) {
	
	Variable_Order obj_Variable_Order = new Variable_Order();
	
	obj_Variable_Order = it_list.next();
	
%>		
	
	<tr>
	
		<td style="width: 12.67%"><%=obj_Variable_Order.getTag() %></td>
		<td style="width: 16.67%"><%=obj_Variable_Order.getDateReceive() %></td>
		<td style="width: 16.67%"><%=obj_Variable_Order.getClientName() %></td>
		<td style="width: 20.67%"><%=obj_Variable_Order.getContactNumber() %></td>
		<td style="width: 16.67%"><%=obj_Variable_Order.getLocation() %></td>
		<td style="width: 16.67%"><%=obj_Variable_Order.getIncharge() %></td>
		
	</tr>
	
<%	
	
}

%>	    

         </table>  
       </div>
    </td>
  </tr>
</table>
</div>
</div>


  <div class="search2">
    <a class="modalb" href="/IMS/REPORTS/Reports.jsp" onclick="HTMLtoPDF2()">Download PDF</a>
  </div>

<div class="mainframe2">
    <h2>Inventory</h2>
<div class="ex2">
 <table cellspacing="0" cellpadding="0" border="0">
  <tr>
    <td>
       <div style="width:1050px; height:260px; overflow:auto;" id="HTMLtoPDF2">
       
         <table cellspacing="0" cellpadding="3" width="1050" class="eto">
         
      <tr>
        <th onclick="sortTable(0)" style="width: 8.29%;">Tag</th>
        <th onclick="sortTable(1)" style="width: 18.29%;">Date</th>
        <th onclick="sortTable(2)" style="width: 14.29%;">Model</th>
        <th onclick="sortTable(3)" style="width: 12.29%;">Quantity</th>
        <th onclick="sortTable(3)" style="width: 12.29%;">Price</th>
        <th onclick="sortTable(3)" style="width: 14.29%;">Brand</th>
        <th onclick="sortTable(3)" style="width: 20.29%;">Category</th>
      </tr>
         
<%

Get_Value obj_Get_Value1 = new Get_Value();

List<Variable_Product> list1 = obj_Get_Value.Product();

Iterator<Variable_Product> it_list1 = list1.iterator();

while (it_list1.hasNext()) {
	
	Variable_Product obj_Variable_Product = new Variable_Product();
	
	obj_Variable_Product = it_list1.next();
	
%>	

	<tr>
	
		<td style="width: 8.29%;"><%=obj_Variable_Product.getTag() %></td>
		<td style="width: 18.29%;"><%=obj_Variable_Product.getDateReceive() %></td>
		<td style="width: 14.29%;"><%=obj_Variable_Product.getName() %></td>
		<td style="width: 12.29%;"><%=obj_Variable_Product.getQuantity() %></td>
		<td style="width: 12.29%;">P<%=obj_Variable_Product.getPrice() %></td>
		<td style="width: 14.29%;"><%=obj_Variable_Product.getBrand() %></td>
		<td style="width: 20.29%;"><%=obj_Variable_Product.getCategory() %></td>
		
	</tr>
	
<%	
	
}

%>	        

         </table>  
       </div>
    </td>
  </tr>
</table>
</div>
</div>


  <div class="search2">
    <a class="modalb" href="/IMS/REPORTS/Reports.jsp" onclick="HTMLtoPDF3()">Download PDF</a>
  </div>

<div class="mainframe2">
    <h2>Purchasing</h2>
<div class="ex2">
 <table cellspacing="0" cellpadding="0" border="0">
  <tr>
    <td>
       <div style="width:1050px; height:260px; overflow:auto;" id="HTMLtoPDF3">
       
         <table cellspacing="0" cellpadding="3" width="1050" class="eto">
         
      <tr>
        <th onclick="sortTable(0)">Order Number</th>
        <th onclick="sortTable(1)">Acquisition Date</th>
        <th onclick="sortTable(2)">Client Name</th>
        <th onclick="sortTable(3)">Contact Number</th>
        <th onclick="sortTable(4)">Location</th>
      </tr>
         
<%

Get_Value obj_Get_Value2 = new Get_Value();

List<Variable_Order> list2 = obj_Get_Value.Order();

Iterator<Variable_Order> it_list2 = list2.iterator();

while (it_list2.hasNext()) {
	
	Variable_Order obj_Variable_Order = new Variable_Order();
	
	obj_Variable_Order = it_list2.next();
	
%>	

	<tr>
	
		<td><%=obj_Variable_Order.getTag() %></td>
		<td><%=obj_Variable_Order.getDateReceive() %></td>
		<td><%=obj_Variable_Order.getClientName() %></td>
		<td><%=obj_Variable_Order.getContactNumber() %></td>
		<td><%=obj_Variable_Order.getLocation() %></td>
	</tr>
	
<%	
	
}

%>	        

         </table>  
       </div>
    </td>
  </tr>
</table>
</div>
</div>

</body>
</html>
