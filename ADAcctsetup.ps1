$Domain = (get-ADDomain).distinguishedname
$objOU="cn=Users," + $Domain
$pwd = "Password1"

$group1 = "Cn=Managers," + $objOU
dsadd group $group1 -secgrp yes -scope l 
$group2 = "Cn=ITStaff," + $objOU
dsadd group $group2 -secgrp yes -scope l 
$group3 = "Cn=ITManager," + $objOU
dsadd group $group3 -secgrp yes -scope l 
dsquery group $group2 | dsmod group $group1 -addmbr 
$group4 = "Cn=Sales," + $objOU
dsadd group $group4 -secgrp yes -scope l 
$group5 = "Cn=SalesManager," + $objOU
dsadd group $group5 -secgrp yes -scope l 
dsquery group $group5 | dsmod group $group1 -addmbr 
$group6 = "Cn=ADMinorSales," + $objOU
dsadd group $group6 -secgrp yes -scope l 
$group7 = "Cn=ADAdultSales," + $objOU
dsadd group $group7 -secgrp yes -scope l 
$group8 = "Cn=ADAllStaff," + $objOU
dsadd group $group8 -secgrp yes -scope l 
dsquery group $group8 | dsmod group $group2 -addmbr 
dsquery group $group8 | dsmod group $group4 -addmbr 

$user = "cn=AndyA," + $objOU
dsadd user $user -pwd $pwd -mustchpwd "no" -disabled no
dsquery user $user | dsmod group $group3 -addmbr 
dsquery user $user | dsmod group $group2 -addmbr 
$user = "cn=BorisR," + $objOU
dsadd user $user -pwd $pwd -mustchpwd "no" -disabled no
dsquery user $user | dsmod group $group2 -addmbr 
$user = "cn=CarlyC," + $objOU
dsadd user $user -pwd $pwd -mustchpwd "no" -disabled no
dsquery user $user | dsmod group $group2 -addmbr 
$user = "cn=DonaldF," + $objOU
dsadd user $user -pwd $pwd -mustchpwd "no" -disabled no
dsquery user $user | dsmod group $group2 -addmbr 

$user = "cn=SlimG," + $objOU
dsadd user $user -pwd $pwd -mustchpwd "no" -disabled no
dsquery user $user | dsmod group $group5 -addmbr 
dsquery user $user | dsmod group $group4 -addmbr 
$user = "cn=ChetW," + $objOU
dsadd user $user -pwd $pwd -mustchpwd "no" -disabled no
dsquery user $user | dsmod group $group4 -addmbr 
dsquery user $user | dsmod group $group7 -addmbr 
$user = "cn=RagbirT," + $objOU
dsadd user $user -pwd $pwd -mustchpwd "no" -disabled no
dsquery user $user | dsmod group $group4 -addmbr 
$user = "cn=AngelaY," + $objOU
dsadd user $user -pwd $pwd -mustchpwd "no" -disabled no
dsquery user $user | dsmod group $group4 -addmbr 
dsquery user $user | dsmod group $group6 -addmbr 
