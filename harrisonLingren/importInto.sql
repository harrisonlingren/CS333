insert into Flight_info(Year, Month, Day_of_month, Unique_carrier, Fl_num, Origin_airport_id, Dest_airport_id, Tail_num, Dep_delay_new, Arr_delay_new)
	select distinct YEAR, MONTH, DAY_OF_MONTH, UNIQUE_CARRIER, FL_NUM, ORIGIN_AIRPORT_ID, DEST_AIRPORT_ID, TAIL_NUM, DEP_DELAY_NEW, ARR_DELAY_NEW from import

insert into cities(city_name, state_abr, city_market_id)
	select distinct ORIGIN_CITY_NAME, ORIGIN_STATE_ABR, ORIGIN_CITY_MARKET_ID from import
	
insert into quarters(Month, quarter)
	select distinct MONTH, QUARTER from import

insert into dates(Year, Month, Day_of_month, Day_of_week)
	select distinct YEAR, MONTH, DAY_OF_MONTH, DAY_OF_WEEK from import

insert into Airports(Airport_id, City_name)
	select distinct ORIGIN_AIRPORT_ID, ORIGIN_CITY_NAME from import