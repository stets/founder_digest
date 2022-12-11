## Table Name Here

- attribute_name (data type)


## Users (aka Founders)

If a user exists, it has a pair to a user submission with status approved
- email
- first name
- last name
- website
- job_role
- user submission id (MAYBE)

rails g migration Create-<Table-Name> attr1:boolean attr2:string attr3

rails g migration DoSomethingAwesomeWithUsers

rails g migration AddFirstNameToUsers first_name

rails g migration AddMoreAttrsToUsers

rails g migration RemoveAdminFromUsers


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

rails g migration CreateUserSubmissions email:string first_name last_name website job_role text status 
To also generate a model, do
rails g model CreateUserSubmissions email:string first_name last_name website job_role text status 


## Projects (aka Newsletters, Stakeholder Updates)
- title (example: Fomo.com)
- description (example: monthly updates from bootstrapped solo founder.)
- user submission id (maybe)
- avatar_url ( https://fomo.com/favicon.ico ) 
    - we are not storing an image, just a link to it! Sometimes a favicon, sometimes logo  
- user_id (ex: 5)

rails g model Projects title website description avatar_url user:references

user:references handles foreign key

## StakeholderUpdates (this is the actual update)

- title
- content (example: "This month we...")
- digest_id (which Digest does this update belong to?)

rails g model StakeHolderUpdate title content project:references 


## Subscriptions

- digest_id (example: 4) example: fomo
- user_id: (example: 2)
users w relationships to other users
- subscribers_count

rails g model Subscription project:references user:references