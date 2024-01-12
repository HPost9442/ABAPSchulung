@EndUserText.label: 'Movie Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ZC_S4D_Movie as projection on ZR_S4D_Movie
{
  key MovieUUID,
  @Search.fuzzinessThreshold: 0.7
  @Search.defaultSearchElement: true
  Title,
  Genre,
  PublishingYear,
  RuntimeInMin,
  ImageURL,
  CreatedAt,
  CreatedBy,
  LastChangedAt,
  LastChangedBy,
  AverageRating,
  AverageRatingCriticality,
  RuntimeText,
  _Ratings : redirected to composition child ZC_S4D_Rating
}


