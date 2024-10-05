use `awesome chocolates`;
select * from sales;
select amount,customers,geoid from sales;
select saledate,amount,boxes,amount/boxes as amount_per_box from sales; 

select * from sales
where amount>10000; 

select * from sales
where geoid='g1'
order by pid,amount desc;


select * from sales
where amount>10000 and saleDate >=  '2022-01-01';

select * from sales
where boxes between 0 and 50; 


select saledate, amount,boxes,weekday(saledate) as s from sales
 having s=4;
 
   select * from people
   where team='delish' or team ='jucies';
   
   
   select * from people 
   where team in ('delish','jucies');
   
   select * from people
    where salesperson like 'b%';
    
     select * from people
    where salesperson like '%b%';
    
    select saledate,amount,
case when amount<1000 then 'under 1k'
when amount<5000 then 'under 5 k'
when amount<10000 then 'under 10 k'
else '10k or more'
end as 'amount category'
from sales; 

-- join queries
 
select s.saledate,s.amount,p.salesperson,s.spid,p.spid
from sales s
join people p on s.spid=p.spid;
    
    
    select s.saledate,s.amount,pr.product
    from sales s
    left join products pr on pr.pid=s.pid;
    
    select s.saledate,s.amount,p.salesperson,pr.product,p.team
    from sales s
     join people p on p.spid=s.spid
     join products pr on pr.pid=s.pid
     where s.amount<500
     and p.team='';
     
     
         select s.saledate,s.amount,p.salesperson,pr.product,p.team
    from sales s
     join people p on p.spid=s.spid
     join products pr on pr.pid=s.pid
     join geo g on g.geoid= s.geoid
     where s.amount<500
     and p.team=''
     and g.geo in('new zealans','india')
     order by saledate ;
     
     -- group by
     
     select g.geo,sum(amount),avg(amount),sum(boxes)
     from sales s
     join geo g on g.geoid=s.geoid
     group by g.geo;
     
     
     select pr.category,p.team,sum(boxes),sum(amount)
     from sales s
     join people p on p.spid=s.spid
     join products pr on pr.pid=s.pid
     where p.team <>''
     group by pr.category,p.team; 
     
     
     