
  
    

  create  table "jaffle_shop"."dw"."stg_customers__dbt_tmp"
  
  
    as
  
  (
    with customers as (
    
    select 
        id as customer_id,
        first_name,
        last_name

    from jaffle_shop.customers
)

select * from customers
  );
  