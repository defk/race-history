select
       t.driver_id,
       SUM(p.points) as points,
       SUM(p.order_points) as order_points
from data t
       join drivers d on d.id = t.driver_id
       join result_points p on t.result_point_id=p.id

where
    t.championship_id = 1
group by driver_id
order by points desc, order_points desc
