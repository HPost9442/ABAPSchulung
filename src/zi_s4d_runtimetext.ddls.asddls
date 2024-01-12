@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Runtime Interface View'

define view entity ZI_S4D_RuntimeText
  as select from zabap_movie_a
{
  key movie_uuid  as MovieUUID,
  case when runtime_in_min > 150 then 'Überlänge'
  when runtime_in_min < 30 then 'Kurzfilm'
  else '' end as RuntimeText
}
