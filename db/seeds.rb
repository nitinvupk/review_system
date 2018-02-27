# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', is_admin: true) if Rails.env.development?
