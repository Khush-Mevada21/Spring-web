<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Box Cricket Registration</title>
</head>
<body>

<h2>Box Cricket Registration</h2>
<br>
<form action="savereg" method="post">
	Name : <input type="text" name="studentName" value="${studentNameValue}"/>
	<span style="color:red">${studentNameError}</span>
	<br><br>
	
	Playing Type :
		Batsman <input type="radio" ${playingTypeValue!=null && playingTypeValue.equals("Batsman")?"checked":"" } name="playingType" value="Batsman"/>
		Bowler <input type="radio" ${playingTypeValue!=null && playingTypeValue.equals("Bowler")?"checked":"" } name="playingType" value="Bowler"/>
		All Rounder <input type="radio" ${playingTypeValue != null && playingTypeValue.equals("All Rounder") ? "checked":"" } name="playingType" value="All Rounder"/>
		<span style="color:red">${playingTypeError}</span>
		<br><br>
		
	Food Preference :
		<select name="foodPreference">
			<option value="-1">---Select---</option>
			<option value="Regular" ${foodPreferenceValue != null && foodPreferenceValue.equals("Regular") ? "selected":"" }>Regular</option>
			<option value="Jain" ${foodPreferenceValue != null && foodPreferenceValue.equals("Jain") ? "selected":"" }>Jain</option>
		</select>
		<span style="color:red">${foodPreferenceError}</span>
		<br><br>
	
	Drink :
		RedBull <input type="checkbox" name="drink" value="rb" ${drinkValue.contains("rb") ? "checked":""}/>
		Mountain Dew <input type="checkbox" name="drink" value="md" ${drinkValue.contains("md") ? "checked":""}/>
		Cocacola <input type="checkbox" name="drink" value="co" ${drinkValue.contains("co") ? "checked":""}/>
		Lemon Juice <input type="checkbox" name="drink" value="lj" ${drinkValue.contains("lj") ? "checked":""}/>
		Thumsup <input type="checkbox" name="drink" value="tu" ${drinkValue.contains("tu") ? "checked":""}/> 
		<span style="color:red">${drinkError}</span>
		<br><br>
		
	<input type="Submit" value="Register"/>

</form>

</body>
</html>