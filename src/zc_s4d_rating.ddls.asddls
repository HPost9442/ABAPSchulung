@EndUserText.label: 'Rating Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_S4D_Rating as projection on ZR_S4D_Rating
{
  key RatingUUID,
  MovieUUID,
  UserName,
  Rating,
  RatingDate,
  GenreText,
  /* Associations */
  _Movie: redirected to parent ZC_S4D_Movie  
  

}
