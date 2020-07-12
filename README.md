# mahima-java-project
This is  my shopping Cart web project in advance Java using Servlet ,JSP ,MySql for database
1.)	 Project Specifications:-

1.1)	Project Overview:-
Overview of the project is as following:-
Scope of the work:-
•	User can register, login and check the products with his specific id. 
•	This project provides the user the advantage of saving their time.
•	Our project replaces the time consumption to be decreased, and remove the middle man and make the product in low price.
•	They can be up to date with market through our web site.

1.2)	Project Need:-
       A cart typically has three common aspects:
1.	It stores product information
2.	It's a gateway for order, catalog and customer management
3.	It renders product data, categories and site information for user display

2.)	Specific Requirements:-

2.1) External Interface Requirements:-
Application would be a self-contained system. It will not access data of any other application nor do other applications have access to its data. Application will be accessed through a Browser interface. No user would be able to access any part of the application without logging onto the system.

2.2) Hardware Interfaces:-
I.	RAM Required- 512 MB
II.	HARD DISK-1 GB

2.3) Software Interfaces:-
I.	Front-end-HTML, CSS
II.	Back-end-CORE AND ADVANCE JAVA with NETBEANS IDE and MySQL database.
III.	OS-Windows.
IV.	Browsers-All Internet Browsers.

2.4) Communication Protocols:-
•	Security 
The security requirements deal with the primary security. The software should be handled only by the administrator and authorized users. Only the administrator has right to assign permission like creating new accounts and generating password. Only authorized users can access the system with username and password.
 
•	Maintainability
Backups for database are available.

•	Portability
The software is a web-based application and is built in java and MYSQL. So it is platform independent and is independent of operating system.

3.) Software Product Features:-
3.1) System Architecture:-
The architecture provides the application which is a self-contained system and it will not access data of any other application. The system module provides the registration page, login, logout and the products using their specific id and password.

3. 2) Database Requirements:-

1)	Category 

Field	Type	Null	Key	Default	Extra
cat_id	int(11)	NO	PRI	NULL	
cat-name	char(20)	YES		NULL	

2) Items
Field	Type	Null	Key	Default	Extra
item_id	int(11)	NO	PRI	NULL	
cat_id	int(11)	YES		NULL	
subcat_id	int(11)	YES		NULL	
item_name	char(20)	YES		NULL	
Price	int(11)	YES		NULL	
Image	char(20)	YES		NULL	
Stock	int(11)	YES		0	
Details	char(225)	YES		NULL	

3) Porders

Field	Type	Null	Key	Default	Extra
order_id	int(11)	NO	PRI	NULL	auto_increment
User	char(10)	YES		NULL	
Amount	int(11)	YES		NULL	
Delivered	int(11)	YES		NULL	

4) Porders_det

Field	Type	Null	Key	Default	Extra
order_id	int(11)	YES		NULL	
item_id	int(11)	YES		NULL	
Qty	int(11)	YES		NULL	
Price	int(11)	YES		NULL	
Amount	int(11)	YES		NULL	

