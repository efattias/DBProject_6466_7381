create or replace function get_organizer(location INT) return varchar2 is
  organizerNmae organizer.organizername%type;
  phone_o organizer.phone%type;
  email_o organizer.email%type;
begin
    select o.organizername, o.phone, o.email
    INTO organizerNmae, phone_o, email_o
    from organizer o JOIN event e on o.organizerid = e.organizerid JOIN locations l ON l.locationid = e.locationid
    where l.locationid = location 
    and rownum = 1;
      return 'organizer name- ' || organizerNmae || ' phone- ' || phone_o || ' email- ' || email_o;
     EXCEPTION
         WHEN NO_DATA_FOUND THEN
           RETURN NULL;
        when others
          then raise;

end get_organizer;
/
