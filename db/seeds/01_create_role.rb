r1 = Role.create({ name: :client, description: 'Normal user' })
r2 = Role.create({ name: :moderator, description: 'Can perform any CRUD operation on any resource except admin' })
r3 = Role.create({ name: :admin, description: 'Can perform any CRUD operation on any resource' })