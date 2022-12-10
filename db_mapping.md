## Table Name Here

- attribute_name (data type)


## Feedbacks 

- id (integer) / created_at (datetime) / updated_at (datetime) - all auto included
- recipient_handle (string)
- tweet_id (string)

## UserSubmissions

If a submission is approved, we will map (copy/paste) the fields to a User record

- email
- first name
- last name
- website
- job_role
- text
- status (pending, approved, rejected)
- user id (maybe)

## Users (aka Founders)
If a user exists, it has a pair to a user submission with status approved
- email
- first name
- last name
- website
- job_role
- user submission id (maybe)

## Digests (aka Newsletters, Stakeholder Updates)
- title (example: Fomo.com)
- description (example: monthly updates from bootstrapped solo founder.)
- user submission id (maybe)
- avatar_url ( https://fomo.com/favicon.ico ) 
    - we are not storing an image, just a link to it! Sometimes a favicon, sometimes logo  
- user_id (ex: 5)

## StakeholderUpdates (this is the actual update)

- content (example: "This month we...")
- digest_id (which Digest does this update belong to?)


## Subscriptions

- digest_id (example: 4) example: fomo
- user_id: (example: 2)
users w relationships to other users
- subscribers_count


ERD - Entity Relationship diagram

