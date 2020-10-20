Models: 
    Kid
    - has_many :behavior_logs
    - has_many :users, through: behavior_logs
    - name:string
    - birthday:string

    User/Caregiver
    - has_many :behavior_logs
    - has_many :kids, through: behavior_logs
    - username:string
    - email: string
    - password_digest:string


    BehaviorLog/join table(has 2 belongs_to and this makes it a join table)
    - belongs_to :kid
    - belongs_to :user
    - date:date
    - time:datetime
    - location:string
    - before_behavior:string
    - behavior_content:string
    - outcome:string

Generators to Use: 
- resource 

User sign-up: 
- has_secure_password (authenticate, validate password &/or password confirmation)
- bcrypt gem add to Gemfile

nested routes: 
'/users/
'/users/:id/behavior_logs'
'/users/:id/kids
'/kids'
'/kids/:id/behavior_logs
'/kids/:id/users
