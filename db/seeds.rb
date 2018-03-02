User.destroy_all

users = [
  {
    first_name: 'Bobby',
    last_name: 'Vee',
    username: 'bvee',
    password: 'bvee'
  },
  {
    first_name: 'Ricky',
    last_name: 'Roe',
    username: 'rroe',
    password: 'rroe'
  },
  {
    first_name: 'Jenny',
    last_name: 'Jan',
    username: 'jjan',
    password: 'jjan'
  },
]

User.create(users)
