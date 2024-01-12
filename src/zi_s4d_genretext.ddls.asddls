@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Transient Genre Texrt'

define view entity ZI_S4D_GenreText
  as select from zabap_movie_a
{
  key movie_uuid as MovieUuid,
      case genre
        when 'DRAMA' then 'Drama'
        when 'FANTASY' then 'Fantasy'
        when 'THRILLER' then 'thriller'
        when 'HORROR' then 'Horror'
        when 'COMEDY' then 'Comedy'
        when 'SCIFI' then 'Science Fiction'
        when 'ACTION' then 'Action'
        when 'ANIMATION' then 'Animation'
        else ''
        end      as GenreText


}
