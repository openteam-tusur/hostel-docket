Hostel.destroy_all if Hostel.any?
Hostel.create([
  {
    title: 'Общежитие №3',
    address: 'пр. Кирова, 56а',
    contingent_id: 130
  },
  {
    title: 'Общежитие №4',
    address: 'ул. Ф. Лыткина, 10',
    contingent_id: 132
  },
  {
    title: 'Общежитие №5',
    address: 'ул. Ф. Лыткина, 18',
    contingent_id: 134
  },
  {
    title: 'Общежитие №6',
    address: 'ул. Ф. Лыткина, 8',
    contingent_id: 135
  },
])
