-- Get Contacts whose birthday is today.
SELECT cast(custom_attributes ->> 'Birthdate' as date)
FROM contacts
where extract(month from cast(custom_attributes ->> 'Birthdate' as date)) = extract(month from current_date)
  and extract(day from cast(custom_attributes ->> 'Birthdate' as date)) = extract(day from current_date);
