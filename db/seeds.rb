# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_sudo = User.create(email: "zordon@imedia.com", password: "swordfish", super_admin: true)
person_sudo = Person.create(name: "Zordon", telephone: "9999-9999")
person_sudo.user = user_sudo

media_company_sudo = MediaCompany.create(cnpj: 99999999)
media_company_sudo.person = person_sudo
media_company_sudo.save