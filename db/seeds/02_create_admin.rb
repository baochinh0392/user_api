
unless User.exists?(email: 'baochinh@gmail.com')
  admin = User.create!(email: 'baochinh@gmail.com', name: 'Bao Chinh', password: '123456')
  admin.add_role :admin
end

unless User.exists?(email: 'support@gmail.com')
  mod = User.create!(email: 'support@gmail.com', name: 'supporter', password: '123456')
  mod.add_role :moderator
end