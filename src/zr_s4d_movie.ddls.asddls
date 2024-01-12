@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie Base View'
define root view entity ZR_S4D_Movie
  as select from    zabap_movie_a
    left outer join ZR_S4D_AverageRating on zabap_movie_a.movie_uuid = ZR_S4D_AverageRating.MovieUuid
  association [1..1] to ZI_S4D_GenreText   as _GenreText   on _GenreText.MovieUuid = zabap_movie_a.movie_uuid
  association [1..1] to ZI_S4D_RuntimeText as _RuntimeText on $projection.MovieUUID = _RuntimeText.MovieUUID
  composition [0..*] of ZR_S4D_Rating      as _Ratings
{
  key zabap_movie_a.movie_uuid                      as MovieUUID,
      zabap_movie_a.title                           as Title,
      zabap_movie_a.publishing_year                 as PublishingYear,
      zabap_movie_a.runtime_in_min                  as RuntimeInMin,
      zabap_movie_a.image_url                       as ImageURL,
      zabap_movie_a.created_at                      as CreatedAt,
      zabap_movie_a.created_by                      as CreatedBy,
      zabap_movie_a.last_changed_at                 as LastChangedAt,
      zabap_movie_a.last_changed_by                 as LastChangedBy,
      zabap_movie_a.rating                          as Rating,
      ZR_S4D_AverageRating.AverageRating            as AverageRating,
      ZR_S4D_AverageRating.AverageRatingCriticality as AverageRatingCriticality,

      // Make association public
      _RuntimeText.RuntimeText                      as RuntimeText,
      _GenreText.GenreText                          as Genre,

      //Composition
      _Ratings
}
