/* Script to delete users except admin and haraujo*/

delete from legaldocumenthistory where user_id <> 1 AND user_id <> 2;
delete from users_role where users_id <> 1 AND users_id <> 2;
delete from user_contract where user_id <> 1 AND user_id <> 2;
delete from users_legaldocumentcategory where users_id <> 1 AND users_id <> 2;
delete from legaldocumenthistory where user_id  <> 1 AND user_id <> 2;
update legaldocument set changedby_id = 2; 
delete from users where id <> 1 AND id <> 2;

update configuration set value='emailaddress' where key='certitools.info.email';
