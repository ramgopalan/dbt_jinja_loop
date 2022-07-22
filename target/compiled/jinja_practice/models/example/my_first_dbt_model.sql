/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/












    
     
    
    
        
    
    
    
    SELECT  A2.NAME, sum(A2.NAME) FROM A2
    
    
        UNION ALL
    
    SELECT  A2.ADDRESS, sum(A2.ADDRESS) FROM A2
    
 
   
        UNION ALL
     
     
    
    
        
    
    
    
    SELECT  A1.VALUE, sum(A1.VALUE) FROM A1
    
    
        UNION ALL
    
    SELECT  A1.NAME, sum(A1.NAME) FROM A1
    
    
        UNION ALL
    
    SELECT  A1.ID, sum(A1.ID) FROM A1
    
 