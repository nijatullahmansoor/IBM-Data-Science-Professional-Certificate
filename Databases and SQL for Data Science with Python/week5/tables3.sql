SELECT COMMUNITY_AREA_NAME FROM CENSUS_DATA
where PER_CAPITA_INCOME < 11000;


select * from census_data;
select * FROM chicago_crime_data;
SELECT * FROM chicago_public_schools;

select 'Elementary, Middle, or High School', avg(safety_score)
from chicago_public_schools
group by 'Elementary, Middle, or High School';
