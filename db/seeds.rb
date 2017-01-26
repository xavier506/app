# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
  email: 'gardella@pcalogistica.com',
  password: 'sexavier69',
  password_confirmation: 'sexavier69',
  admin: true
)
user.save!

client = Client.new(
  company: 'Novelteak Costa Rica S.A.',
  contact_name: '',
  email: 'novelteak@gmail.com',
  telephone: '',
  address: '100 metros Sur y 100 metros Este del Hotel Boyeros, Centro Comercial Orosi',
  city: 'Liberia',
  state: 'Guanacaste',
  country: 'CR',
  zip: ''
)
client.save!

consignee = Consignee.new(
  company: 'Geetha timbers',
  contact_name: 'Jayanth Patel',
  email: '',
  telephone: '',
  address: 'No.42/ h, Industrial Suburb',
  city: 'Mysore',
  state: 'Karnataka',
  country: 'IN',
  zip: '570008'
)
consignee.save!

notify = Notification.new(
  company: 'GT Timber LLC',
  contact_name: '',
  email: 'GTTIMBERLLC@GMAIL.COM',
  telephone: '1-409-225-0451',
  address: '1811 GlenLyon Drive',
  city: 'Richmond',
  state: 'Texas',
  country: 'US',
  zip: '77407'
)
notify.save!


