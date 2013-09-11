Hostel.destroy_all if Hostel.any?
Hostel.create([
  {
    :title => 'Общежитие №3',
    :address => 'пр. Кирова, 56а',
    :contingent_id => 130
  },
  {
    :title => 'Общежитие №4',
    :address => 'ул. Ф. Лыткина, 10',
    :contingent_id => 132
  },
  {
    :title => 'Общежитие №5',
    :address => 'ул. Ф. Лыткина, 18',
    :contingent_id => 134
  },
  {
    :title => 'Общежитие №6',
    :address => 'ул. Ф. Лыткина, 8',
    :contingent_id => 135
  },
])

Point.destroy_all if Point.any?
Point.create([
  {
    :number => '1.1',
    :description => 'Отсутствие замечаний по выполнению обязанностей рабочей комнаты в учебном году (по итогам года)',
    :mark => 50,
    :initiator => [:monitor]
  },
  {
    :number => '1.2',
    :description => 'Отсутствие замечаний по сан. состоянию комнаты по итогам года (средний балл комнаты за год по критерию оценок сан. комиссии больше или равен 3.5)',
    :mark => 30,
    :initiator => [:sanitary_committee]
  },
  {
    :number => '1.3',
    :description => 'Работа в составе студсовета  общежития, сан. комиссии, старосты комнаты, этажа (секции), общественная работа, организация или участие в организации досуговых, спортивных и  иных мероприятиях проводимых в общежитии или университете, по итогам года',
    :mark => 30,
    :initiator => [:monitor]
  },
  {
    :number => '1.4',
    :description => 'Исправное электрооборудование в комнате, хорошее состояние или ремонт комнаты (по итогам года)',
    :mark => 20,
    :initiator => [:monitor]
  },
  {
    :number => '1.5',
    :description => 'Содействие администрации в поддержании  внутреннего распорядка общежития',
    :mark => 20,
    :initiator => [:monitor]
  },
  {
    :number => '1.6',
    :description => 'Разовые выполнения поручений администрации общежития',
    :mark => 10,
    :initiator => [:monitor]
  },
  {
    :number => '1.7',
    :description => 'Выполнение хозяйственных работ (1 бал/час)',
    :mark => 1,
    :initiator => [:monitor]
  },
  {
    :number => '2.1',
    :description => 'Громкая музыка, шум, крики после 23.00 (сотрудник СООПР отрядя ходатайствует о выставлении баллов только после второго предупреждения в присутствии старосты этажа(секции), или представителя Студсовета общежития)',
    :mark => -30,
    :initiator => [:monitor, :orderly]
  },
  {
    :number => '2.2',
    :description => 'Нахождение  на подоконниках открытых окон, на перилах балконов',
    :mark => -10,
    :initiator => [:monitor, :orderly]
  },
  {
    :number => '2.3',
    :description => 'Отсутствие пропуска в общежитие и препятствие работе пропускной системы (на основание журнала вахты)',
    :mark => -10,
    :note => [:eviction],
    :initiator => [:orderly]
  },
  {
    :number => '2.4',
    :description => 'Нахождение в комнате посторонних лиц без разрешения зав. общ. после 23 .00  (посторонние – лица, не проживающие в данном общежитии, кроме родителей)',
    :mark => -15,
    :initiator => [:orderly]
  },
  {
    :number => '2.5',
    :description => 'Проживание в общежитии без регистрации',
    :mark => [:note_of_warning],
    :initiator => [:orderly]
  },
  {
    :number => '2.6',
    :description => 'Неявка по вызову к администрации общежития, невыполнение распоряжений администрации общежития, студсовета, без уважительной причины',
    :mark => -15,
    :initiator => [:monitor]
  },
  {
    :number => '2.7',
    :description => 'Отказ от выполнения обязанностей по дежурству рабочей  комнатой по общежитию, дежурной комнатой по этажам без уважительной причины',
    :mark => -10,
    :initiator => [:monitor]
  },
  {
    :number => '2.8',
    :description => 'Сокрытие свободного койко-места в комнате',
    :mark => -20,
    :initiator => [:monitor, :orderly]
  },
  {
    :number => '2.9',
    :description => 'Самовольный перенос мебели из комнаты в комнату',
    :mark => -20,
    :initiator => [:monitor]
  },
  {
    :number => '2.10',
    :description => 'Самовольное переселение из комнаты в комнату',
    :mark => -30,
    :initiator => [:monitor, :orderly]
  },
  {
    :number => '2.11',
    :description => 'Распитие спиртных напитков, появление в общежитии в нетрезвом состоянии с грубым нарушением правил внутреннего распорядка общежития',
    :mark => -30,
    :initiator => [:sanitary_committee, :orderly]
  },
  {
    :number => '2.12',
    :description => 'Плохое состояние комнаты, не сдача имущества по описи мат. отв. коменданту, белья в кастелянную при выезде из общежития на летние каникулы',
    :note => [:deprivation, :recovery],
    :initiator => [:monitor, :sanitary_committee]
  },
  {
    :number => '2.13',
    :description => 'Несвоевременная оплата за проживание в общежитии (Наказание в соответствии, договора о найме жилья, задержка оплаты за общежитие более 3-х месяцев)',
    :note => [:eviction],
    :initiator => [:monitor]
  },
  {
    :number => '2.14',
    :description => 'Использование пожарного инвентаря не по назначению',
    :note => [:eviction],
    :initiator => [:monitor, :orderly]
  },
  {
    :number => '2.15',
    :description => 'Использование не по назначению и порча сантехнического оборудования, засорение трапов и унитазов бытовыми отходами, поломка кранов в умывальниках, не выключенная вода в местах общего пользования, порча имущества общежития, в том числе стеновых покрытий надписями и царапинами. Воровство туалетной бумаги, поломка держателей туалетной бумаги, поломка унитазных бочков',
    :note => [:eviction, :sending_down, :recovery],
    :initiator => [:monitor, :sanitary_committee]
  },
  {
    :number => '2.16',
    :description => 'Хулиганство, вымогательство, употребление наркотических средств и аморальное поведение в общежитии',
    :note => [:eviction, :sending_down],
    :initiator => [:monitor, :orderly]
  },
  {
    :number => '3.1',
    :description => 'Антисанитарное состояние комнаты',
    :initiator => [:sanitary_committee]
  },
  {
    :number => '3.2',
    :description => 'Антисанитарное состояние секции этажа',
    :mark => -10,
    :initiator => [:sanitary_committee, :monitor]
  },
  {
    :number => '3.3',
    :description => 'Разбрасывания мусора в коридорах, умывальниках, кубовых, мимо мусороприёмников или мусорных бачков. Выливание воды в мусороприёмники. Использование мусорных баков не по назначению.',
    :mark => -10,
    :initiator => [:sanitary_committee, :monitor]
  },
  {
    :number => '3.4',
    :description => 'Пользование электроплитой с открытой спиралью, самодельными обогревателями и самодельной электропроводкой',
    :mark => -10,
    :initiator => [:monitor, :sanitary_committee]
  },
  {
    :number => '3.5',
    :description => 'Курение в комнате или других неположенных местах',
    :mark => -20,
    :initiator => [:sanitary_committee, :monitor, :orderly]
  },
  {
    :number => '3.6',
    :description => 'Грязные, испорченные постельные принадлежности по вине проживающих',
    :mark => -15,
    :note => [:recovery],
    :initiator => [:sanitary_committee, :monitor]
  },
  {
    :number => '3.7',
    :description => 'Затопление нижних этажей по вине проживающих комнаты, секции',
    :mark => -20,
    :note => [:recovery],
    :initiator => [:sanitary_committee, :monitor]
  },
  {
    :number => '3.8',
    :description => 'Выбрасывание мусора из окон и с балконов',
    :mark => -30,
    :note => [:eviction],
    :initiator => [:sanitary_committee, :monitor]
  },
  {
    :number => '3.9',
    :description => 'Оценка «2» за санитарное состояние комнаты',
    :mark => -5,
    :initiator => [:sanitary_committee]
  }
])
