% Завод, цех, инженер, начальник
% represent(id, tseh(id-зоны, линия), ingeneer(фамилия, имя), boss(фамилия, имя))
represent(1, tseh(1, 1), ingeneer('ФИнженер1', 'ИИнженер1'), boss('ФНачальник1', 'ИНачальник1')).
represent(1, tseh(2, 1), ingeneer('ФИнженер2', 'ИИнженер2'), boss('ФНачальник1', 'ИНачальник1')).
represent(1, tseh(1, 2), ingeneer('ФИнженер3', 'ИИнженер3'), boss('ФНачальник1', 'ИНачальник1')).
represent(1, tseh(2, 2), ingeneer('ФИнженер4', 'ИИнженер4'), boss('ФНачальник1', 'ИНачальник1')).
represent(2, tseh(1, 1), ingeneer('ФИнженер5', 'ИИнженер5'), boss('ФНачальник2', 'ИНачальник2')).
represent(2, tseh(2, 1), ingeneer('ФИнженер6', 'ИИнженер6'), boss('ФНачальник2', 'ИНачальник2')).
represent(2, tseh(1, 2), ingeneer('ФИнженер7', 'ИИнженер7'), boss('ФНачальник2', 'ИНачальник2')).
represent(2, tseh(2, 2), ingeneer('ФИнженер8', 'ИИнженер8'), boss('ФНачальник2', 'ИНачальник2')).
represent(3, tseh(1, 1), ingeneer('ФИнженер9', 'ИИнженер9'), boss('ФНачальник3', 'ИНачальник3')).
represent(3, tseh(2, 1), ingeneer('ФИнженер10', 'ИИнженер10'), boss('ФНачальник3', 'ИНачальник3')).
represent(3, tseh(1, 2), ingeneer('ФИнженер11', 'ИИнженер11'), boss('ФНачальник3', 'ИНачальник3')).
represent(3, tseh(2, 2), ingeneer('ФИнженер12', 'ИИнженер12'), boss('ФНачальник3', 'ИНачальник3')).
represent(4, tseh(1, 1), ingeneer('ФИнженер13', 'ИИнженер13'), boss('ФНачальник4', 'ИНачальник4')).
represent(4, tseh(2, 1), ingeneer('ФИнженер14', 'ИИнженер14'), boss('ФНачальник4', 'ИНачальник4')).
represent(4, tseh(1, 2), ingeneer('ФИнженер15', 'ИИнженер15'), boss('ФНачальник4', 'ИНачальник4')).
represent(4, tseh(2, 2), ingeneer('ФИнженер16', 'ИИнженер16'), boss('ФНачальник4', 'ИНачальник4')).
represent(5, tseh(1, 1), ingeneer('ФИнженер17', 'ИИнженер17'), boss('ФНачальник5', 'ИНачальник5')).
represent(5, tseh(2, 1), ingeneer('ФИнженер18', 'ИИнженер18'), boss('ФНачальник5', 'ИНачальник5')).
represent(5, tseh(1, 2), ingeneer('ФИнженер19', 'ИИнженер19'), boss('ФНачальник5', 'ИНачальник5')).
represent(5, tseh(2, 2), ingeneer('ФИнженер20', 'ИИнженер20'), boss('ФНачальник5', 'ИНачальник5')).

% Отношение завод - фамилия инженера
factory_fingeneer(F,K):-represent(F,_,ingeneer(K,_),_).
% Отношение номер зоны - фамилия инженера
tseh_fingeneer(F,D):-represent(_, tseh(F,_),ingeneer(D,_),_).
% Отношение завод - фамилия начальника
factory_fboss(F,K):-represent(F,_,_,boss(K,_)).
% Отношение линия - зона - завод
line_tseh(F,K,D):-represent(D,tseh(K,F),_,_).
% Отношение завод - зона - фамилия инженера
factory_tseh_ingeneer(F,K,D):-represent(F,tseh(K,_),ingeneer(D,_),_).

menu:-
  write('1 - Найти завод на котором работает инженер с фамилией ?'), nl,
  write('2 - Найти фамилию инженера, работающего в зоне ?'), nl,
  write('3 - Найти завод у которого начальник с фамилией ?'), nl,
  write('4 - Найти линию зоны на заводе ?'), nl,
  write('5 - Найти фамилию инженера, работающего на заводе ? и в зоне ?'), nl,
  write('0 - Выход'), nl,
  read(C),
  action(C).

action(1):-!,
  write('Введите фамилию инженера'), nl,
  read(K),
  factory_fingeneer(F,K),
  write('Номер завода: '),
  write(F), nl,
  menu.
action(2):-!,
  write('Введите номер зоны'), nl,
  read(F),
  tseh_fingeneer(F,D),
  write('Номер зоны: '),
  write(D), nl,
  menu.
action(3):-!,
  write('Введите фамилию начальника'), nl,
  read(K),
  factory_fboss(F,K),
  write('Завод номер: '),
  write(F), nl,
  menu.
action(4):-!,
  write('Введите номер завода'),nl,
  read(D),
  write('Введмте номер зоны'),nl,
  read(K),
  line_tseh(F,K,D),
  write('Линия: '),
  write(F), nl,
  menu.
action(5):-!,
  write('Введите номер завода '), nl,
  read(F),
  write('Введите номер зоны'), nl,
  read(K),
  factory_tseh_ingeneer(F,K,D),
  write('Фамилия инженера: '),
  write(D), nl,
  menu.
action(0):-!,
  write('Выход из программы.').

start:-write('Семенков Алексей лабораторная №7'),nl,menu.
