@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Average Rating Base View'

define view entity ZR_S4D_AverageRating
  as select from zabap_rating_a
{
  movie_uuid                    as MovieUuid,
  avg(rating as abap.dec(16,1)) as AverageRating,
  case when avg(rating as abap.dec(16,1)) > 4 then 3
  when avg(rating as abap.dec(16,1)) > 3 then 2
  when avg(rating as abap.dec(16,1)) > 0 then 1
  else 0 end                    as AverageRatingCriticality
}
where
      rating <= 5
  and rating >  0
group by
  movie_uuid
