@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating Base View'

define view entity ZR_S4D_Rating
  as select from zabap_rating_a
  association [1..1] to ZI_S4D_GenreText as _GenreText on zabap_rating_a.movie_uuid = _GenreText.MovieUuid
  association to parent ZR_S4D_Movie as _Movie on _Movie.MovieUUID = $projection.MovieUUID
  
{
  key rating_uuid as RatingUUID,
      movie_uuid  as MovieUUID,
      user_name   as UserName,
      rating      as Rating,
      rating_date as RatingDate,
      _Movie,
      
      /*Transient*/
      _GenreText.GenreText
}
