# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all

# 20.times do 
#     User.create(username: Faker::FunnyName.name, email: Faker::Internet.email, password: "1234")
# end 

#KIDS:
oliver = Kid.create(name: "Oliver", birthday: "2018-07-18")
ashley = Kid.create(name: "Ashley", birthday: "2016-06-17")
courtney = Kid.create(name: "Courtney", birthday: "2014-05-16")
sara = Kid.create(name: "Sara", birthday: "2010-04-15")
aly  = Kid.create(name: "Aly", birthday: "2014-02-14")
hailey  = Kid.create(name: "Hailey", birthday: "2015-01-30")
kaden  = Kid.create(name: "Kaden", birthday: "2016-10-31")
elise  = Kid.create(name: "Elise", birthday: "2019-11-20")
#CAREGIVERS:

thanh = User.create(username: "Thanh", email: "thanh@mail.com", password: "1234")
chris = User.create(username: "Chris", email: "chris@mail.com", password: "1234")
christy = User.create(username: "Christy", email: "christy@mail.com", password: "1234")
minh = User.create(username: "Minh", email: "minh@mail.com", password: "1234")
katrina = User.create(username: "Katrina", email: "katrina@mail.com", password: "1234")
richard = User.create(username: "Richard", email: "ric@mail.com", password: "1234")
truclan = User.create(username: "Truc Lan", email: "truclan@mail.com", password: "1234")
tram = User.create(username: "Tram", email: "tram@mail.com", password: "1234")
bao = User.create(username: "Bao", email: "bao@mail.com", password: "1234")


#BEHAVIOR LOGS: 

oliver_log_1 = BehaviorLog.create(date: "10/01/20", time: "11:00", location: "livingroom", behavior_content: "kicked", before_behavior: "eating snack", outcome: "mom read a book", kid_id: oliver.id, user_id: thanh.id )
oliver_log_2 = BehaviorLog.create(date: "10/02/20", time: "12:00", location: "dinning room", behavior_content: "screamed", before_behavior: "playing lego", outcome: "mom helped cleanup", kid_id: oliver.id, user_id: chris.id)
ashley_log_1 = BehaviorLog.create(date: "9/01/20", time: "10:00", location: "the park", behavior_content: "cried", before_behavior: "playing sand", outcome: "mom carried to the car", kid_id: ashley.id, user_id: christy.id)
ashley_log_2 = BehaviorLog.create(date: "9/02/20", time: "09:00", location: "the theater", behavior_content: "threw body down the floor", before_behavior: "movie done playing", outcome: "dad brough Ashley to the car", kid_id: ashley.id, user_id: minh.id)
courtney_log_1 = BehaviorLog.create(date: "8/01/20", time: "08:00", location: "the backyard", behavior_content: "threw bike at the window", before_behavior: "playing with bike", outcome: "mom sent to room", kid_id: courtney.id, user_id: christy.id)
courtney_log_2 = BehaviorLog.create(date: "8/02/20", time: "07:00", location: "dinner table", behavior_content: "splash water at sister", before_behavior: "eating noodle", outcome: "mom asked to go wash", kid_id: courtney.id, user_id: minh.id)
aly_log_1 = BehaviorLog.create(date: "07/01/20", time: "12:00", location: "the tv room", behavior_content: "threw the remote at sister", before_behavior: "sister asked to change the show", outcome: "mom took tv away for two weeks", kid_id: aly.id, user_id:katrina.id)
aly_log_2 = BehaviorLog.create(date: "07/02/20", time: "13:00", location: "friend's house", behavior_content: "hit friend", before_behavior: "asked friend for a book", outcome: "mom drove aly home", kid_id: aly.id, user_id: richard.id)
sara_log_1 = BehaviorLog.create(date: "06/01/20", time: "14:00", location: "cousin's backyard", behavior_content: "tackled cousin", before_behavior: "cousin took her ball", outcome: "mom asked sara to apologize", kid_id: sara.id, user_id: katrina.id)
sara_log_2 = BehaviorLog.create(date: "06/02/20", time: "15:00", location: "on the couch", behavior_content: "pour juiced on the couch", before_behavior: "sister asked to put the juice away", outcome: "mom grounded sara for one week", kid_id: sara.id, user_id: richard.id)