select g.title, count(p.name)
from genre as g
left join genre_performer as gp on g.id = gp.id_genre
left join performer as p on gp.id_performer = p.id
group by g.title
order by count(p.id) desc;

select t.title, a.year
from albums as a
left join track as t on t.id_album = a.id
where (a.year >= 2019) and (a.year <= 2020);

select a.title, avg(t.duration)
from albums as a
left join track as t on t.id_album = a.id
group by a.title
order by avg(t.duration) desc;

select p.name
from performer as p
left join performer_albums as pa on p.id = pa.id_performer
left join albums as a on pa.id_album = a.id
where not a.year = 2020;

select distinct c.title
from collection as c
left join track_collection as tc on c.id = tc.id_collection
left join track as t on tc.id_track = t.id
left join albums as a on t.id_album = a.id
left join performer_albums as pa on a.id = pa.id_album
left join performer as p on pa.id_performer = p.id
where p.name ~'МакSим'
order by c.title;

select a.title
from albums as a
left join performer_albums as pa on a.id = pa.id_album
left join performer as p on p.id = pa.id_performer
left join genre_performer as gp on p.id = gp.id_performer
left join genre as g on g.id = gp.id_genre
group by a.title
having count(distinct g.title) > 1
order by a.title;

select t.title
from track as t
left join track_collection as tc on t.id = tc.id_track
left join collection as c on c.id = tc.id_collection
where tc.id_collection is null;

select p.name
from track as t
left join albums as a on a.id = t.id_album
left join performer_albums as pa on pa.id_album  = a.id
left join performer as p on p.id = pa.id_performer
group by p.name, t.duration
having t.duration = (select min(duration) from track)
order by p.name;

select a.title
from albums a
left join track t on a.id = t.id_album
group by a.title
having count(t.id) = (select count(id)
                      from track
                      group by id_album
                      order by count
                      limit 1
                      )
order by a.title ;




