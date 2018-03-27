Перем Сервер_Ид;	// server
Перем Сервер_Имя;	// name
Перем Сервер_Адрес;	// agent-host
Перем Сервер_Порт;	// agent-port
Перем Сервер_Параметры;

Перем Кластер_Агент;
Перем Кластер_Владелец;

Перем ПериодОбновления;
Перем МоментАктуальности;

Перем Лог;

// Конструктор
//   
// Параметры:
//   АгентКластера		- АгентКластера	- ссылка на родительский объект агента кластера
//   Кластер			- Кластер		- ссылка на родительский объект кластера
//   Ид					- Строка		- идентификатор сервера в кластере 1С
//
Процедура ПриСозданииОбъекта(АгентКластера, Кластер, Ид)

	Если НЕ ЗначениеЗаполнено(Ид) Тогда
		Возврат;
	КонецЕсли;

	Кластер_Агент = АгентКластера;
	Кластер_Владелец = Кластер;
	Сервер_Ид = Ид;
	
	ПериодОбновления = 60000;
	МоментАктуальности = 0;
	
КонецПроцедуры // ПриСозданииОбъекта()

// Процедура получает данные от сервиса администрирования кластера 1С
// и сохраняет в локальных переменных
//   
// Параметры:
//   ОбновитьПринудительно 		- Булево	- Истина - принудительно обновить данные (вызов RAC)
//											- Ложь - данные будут получены если истекло время актуальности
//													или данные не были получены ранее
//   
Процедура ОбновитьДанные(ОбновитьПринудительно = Ложь) Экспорт

	Если НЕ Служебный.ТребуетсяОбновление(Сервер_Параметры,
			МоментАктуальности, ПериодОбновления, ОбновитьПринудительно) Тогда
		Возврат;
	КонецЕсли;

	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Кластер_Агент.СтрокаПодключения());

	ПараметрыЗапуска.Добавить("server");
	ПараметрыЗапуска.Добавить("info");

	ПараметрыЗапуска.Добавить(СтрШаблон("--server=%1", Ид()));
	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Владелец.Ид()));
	ПараметрыЗапуска.Добавить(Кластер_Владелец.СтрокаАвторизации());

	Служебный.ВыполнитьКоманду(ПараметрыЗапуска);
	
	МассивРезультатов = Служебный.РазобратьВыводКоманды(Служебный.ВыводКоманды());

	ТекОписание = МассивРезультатов[0];

	Сервер_Адрес = ТекОписание.Получить("agent-host");
	Сервер_Порт = ТекОписание.Получить("agent-port");
	Сервер_Имя = ТекОписание.Получить("name");

	ВремСерверы = Новый СерверыКластера(Кластер_Агент, Кластер_Владелец);
	ПараметрыОбъекта = ВремСерверы.ПолучитьСтруктуруПараметровОбъекта();

	Сервер_Параметры = Новый Соответствие();

	Для Каждого ТекЭлемент Из ПараметрыОбъекта Цикл
		ЗначениеПараметра = Служебный.ПолучитьЗначениеИзСтруктуры(ТекОписание,
																  ТекЭлемент.Значение.ИмяПоляРАК,
																  ТекЭлемент.Значение.ЗначениеПоУмолчанию); 
		Сервер_Параметры.Вставить(ТекЭлемент.Ключ, ЗначениеПараметра);
	КонецЦикла;

	МоментАктуальности = ТекущаяУниверсальнаяДатаВМиллисекундах();

КонецПроцедуры // ОбновитьДанные()

// Функция возвращает идентификатор сервера 1С
//   
// Возвращаемое значение:
//	Строка - идентификатор сервера 1С
//
Функция Ид() Экспорт

	Возврат Сервер_Ид;

КонецФункции // Ид()

// Функция возвращает имя сервера 1С
//   
// Возвращаемое значение:
//	Строка - имя сервера 1С
//
Функция Имя() Экспорт

	Если Служебный.ТребуетсяОбновление(Сервер_Имя, МоментАктуальности, ПериодОбновления) Тогда
		ОбновитьДанные(Истина);
	КонецЕсли;

	Возврат Сервер_Имя;
	
КонецФункции // Имя()

// Функция возвращает адрес сервера 1С
//   
// Возвращаемое значение:
//	Строка - адрес сервера 1С
//
Функция Сервер() Экспорт
	
	Если Служебный.ТребуетсяОбновление(Сервер_Адрес, МоментАктуальности, ПериодОбновления) Тогда
		ОбновитьДанные(Истина);
	КонецЕсли;

	Возврат Сервер_Адрес;
		
КонецФункции // Сервер()
	
// Функция возвращает порт сервера 1С
//   
// Возвращаемое значение:
//	Строка - порт сервера 1С
//
Функция Порт() Экспорт
	
	Если Служебный.ТребуетсяОбновление(Сервер_Порт, МоментАктуальности, ПериодОбновления) Тогда
		ОбновитьДанные(Истина);
	КонецЕсли;

	Возврат Сервер_Порт;
		
КонецФункции // Порт()
	
// Функция возвращает значение параметра кластера 1С
//   
// Параметры:
//   ИмяПоля			 	- Строка		- Имя параметра кластера
//   ОбновитьПринудительно 	- Булево		- Истина - обновить список (вызов RAC)
//
// Возвращаемое значение:
//	Произвольный - значение параметра кластера 1С
//
Функция Получить(ИмяПоля, ОбновитьПринудительно = Ложь) Экспорт
	
	ОбновитьДанные(ОбновитьПринудительно);

	Если НЕ Найти(ВРЕг("Ид, server"), ВРег(ИмяПоля)) = 0 Тогда
		Возврат Сервер_Ид;
	ИначеЕсли НЕ Найти(ВРЕг("Имя, name"), ВРег(ИмяПоля)) = 0 Тогда
		Возврат Сервер_Имя;
	ИначеЕсли НЕ Найти(ВРЕг("Сервер, host"), ВРег(ИмяПоля)) = 0 Тогда
		Возврат Сервер_Адрес;
	ИначеЕсли НЕ Найти(ВРЕг("Порт, port"), ВРег(ИмяПоля)) = 0 Тогда
		Возврат Сервер_Порт;
	КонецЕсли;
	
	ЗначениеПоля = Сервер_Параметры.Получить(ИмяПоля);

	Если ЗначениеПоля = Неопределено Тогда
		
		ВремСерверы = Новый СерверыКластера(Кластер_Агент);

		СтруктураПараметров = ВремСерверы.ПолучитьСтруктуруПараметровОбъекта("ИмяПоляРАК");
		
		ОписаниеПараметра = СтруктураПараметров.Получить(ИмяПоля);

		Если НЕ ОписаниеПараметра = Неопределено Тогда
			ЗначениеПоля = Сервер_Параметры.Получить(ОписаниеПараметра["ИмяПараметра"]);
		КонецЕсли;
	КонецЕсли;

	Возврат ЗначениеПоля;
		
КонецФункции // Получить()
	
// Процедура изменяет параметры сервера
//   
// Параметры:
//   ПараметрыСервера	 	- Структура		- новые параметры сервера
//
Процедура Изменить(Знач ПараметрыСервера = Неопределено) Экспорт

	Если НЕ ТипЗнч(ПараметрыСервера) = Тип("Структура") Тогда
		ПараметрыСервера = Новый Структура();
	КонецЕсли;

	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Кластер_Агент.СтрокаПодключения());

	ПараметрыЗапуска.Добавить("server");
	ПараметрыЗапуска.Добавить("update");

	ПараметрыЗапуска.Добавить(СтрШаблон("--server=%1", Ид()));
	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Владелец.Ид()));

	ПараметрыЗапуска.Добавить(Кластер_Владелец.СтрокаАвторизации());
		
	ВремСерверы = Новый СерверыКластера(Кластер_Агент, Кластер_Владелец);
	ПараметрыОбъекта = ВремСерверы.ПолучитьСтруктуруПараметровОбъекта();

	Для Каждого ТекЭлемент Из ПараметрыОбъекта Цикл
		Если НЕ ПараметрыСервера.Свойство(ТекЭлемент.Ключ) Тогда
			Продолжить;
		КонецЕсли;
		ПараметрыЗапуска.Добавить(СтрШаблон(ТекЭлемент.ПараметрКоманды + "=%1", ПараметрыСервера[ТекЭлемент.Ключ]));
	КонецЦикла;

	Служебный.ВыполнитьКоманду(ПараметрыЗапуска);
	
	Лог.Информация(Служебный.ВыводКоманды());

	ОбновитьДанные();

КонецПроцедуры

Лог = Логирование.ПолучитьЛог("ktb.lib.irac");
