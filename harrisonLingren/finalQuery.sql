use harrisonLingren

	select E.Unique_carrier, ((cast(E.avg1 as float) / cast(F.Num_airports as float)) * 100) as percentageDelays
	from (
		select D.Unique_carrier, count(D.Unique_carrier) as avg1 
		from (
			select C.Unique_carrier, C.Dest_airport_id, (C.avg4) as avg2 
			from (
				select avg(cast(Arr_delay_new as float)) as avg3 
				from Flight_info
			) as A, (
				select Unique_carrier, Dest_airport_id, avg(cast(Arr_delay_new as float)) as avg4 
				from Flight_info as B group by Unique_carrier, Dest_airport_id
			) as C where C.avg4 > A.avg3
		) as D group by Unique_carrier
	) as E, (
		select Unique_carrier, count(distinct Dest_airport_id) as Num_airports 
		from Flight_info as B group by Unique_carrier
	) as F
	
	where E.Unique_carrier = F.Unique_carrier
	order by percentageDelays desc;
