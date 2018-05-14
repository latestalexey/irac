Перем ПараметрыКластера;

// Процедура устанавливает вывод функции ВыполнитьКоманду мок-исполнителя команд
//
// Параметры:
//	ИсполнительКоманд	- МокИсполнительКоманд		- мок-объект исполнитель команд
//	ПутьКДанным			- Строка					- Путь к параметрам в структуре параметров кластера
//	
Процедура УстановитьВыводИсполнителяКоманд(ИсполнительКоманд, ПутьКДанным) Экспорт

	МассивПутей = СтрРазделить(ПутьКДанным, ".");

	Данные = ПараметрыКластера;

	Для Каждого ТекПуть Из МассивПутей Цикл
		Данные = Данные[ТекПуть];
	КонецЦикла;

	ИсполнительКоманд.Когда().ВыполнитьКоманду(Данные.ПараметрыКоманды).ТогдаВозвращает(Данные.ВыводКоманды);

КонецПроцедуры // УстановитьВыводИсполнителяКомандНов()

Функция Агент_СтрокаПодключения()

	Возврат "localhost:1545";

КонецФункции // Агент_СтрокаПодключения()

Функция Кластер_Ид()

	Возврат "6d6958ed-a96c-4999-a995-698a0298161e";

КонецФункции // Кластер_Ид()

Функция Кластер_СтрокаАвторизации()

	Возврат "";

КонецФункции // Кластер_СтрокаАвторизации()

Функция Сервер_Ид()

	Возврат "48336b15-d0e0-4c1e-9e9c-49fabfbd0ab5";

КонецФункции // Сервер_Ид()

Функция ПрофильБезопасности_Имя()

	Возврат "ОсновнойПрофиль";

КонецФункции // ПрофильБезопасности_Имя()

Функция ИБ_СтрокаАвторизации()

	СтрокаАвторизации = СтрШаблон("--infobase-user=%1 --infobase-pwd=%2",
									"""Пользователь И. Б.""",
									"123");
	Возврат СтрокаАвторизации;

КонецФункции // ИБ_СтрокаАвторизации()

Функция Вывод_КластерыСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());
	ПараметрыЗапуска.Добавить("cluster");
	ПараметрыЗапуска.Добавить("list");
	
	ВыводКоманды = "cluster                       : " + Кластер_Ид() + "
					|host                          : Sport1
					|port                          : 1541
					|name                          : ""Локальный кластер""
					|expiration-timeout            : 0
					|lifetime-limit                : 0
					|max-memory-size               : 0
					|max-memory-time-limit         : 0
					|security-level                : 0
					|session-fault-tolerance-level : 0
					|load-balancing-mode           : performance
					|errors-count-threshold        : 0
					|kill-problem-processes        : 0
					|
					|";

	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_КластерыСписок()

Функция Вывод_КластерыПараметры()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());
	ПараметрыЗапуска.Добавить("cluster");
	ПараметрыЗапуска.Добавить("info");
	
	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	
	ВыводКоманды = "cluster                       : " + Кластер_Ид() + "
					|host                          : Sport1
					|port                          : 1541
					|name                          : ""Локальный кластер""
					|expiration-timeout            : 0
					|lifetime-limit                : 0
					|max-memory-size               : 0
					|max-memory-time-limit         : 0
					|security-level                : 0
					|session-fault-tolerance-level : 0
					|load-balancing-mode           : performance
					|errors-count-threshold        : 0
					|kill-problem-processes        : 0
					|
					|";

	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_КластерыПараметры()

Функция Вывод_МенеджерыСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("manager");
	ПараметрыЗапуска.Добавить("list");

	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "manager : 0e588a25-8354-4344-b935-53442312aa30
					|pid     : 3388
					|using   : normal
					|host    : Sport1
					|port    : 1541
					|descr   : ""Главный менеджер кластера""
					|
					|";

	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_МенеджерыСписок()

Функция Вывод_СерверыСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("server");
	ПараметрыЗапуска.Добавить("list");

	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "server                              : " + Сервер_Ид() + "
					|agent-host                          : Sport1
					|agent-port                          : 1540
					|port-range                          : 1560:1591
					|name                                : ""Центральный сервер""
					|using                               : main
					|dedicate-managers                   : none
					|infobases-limit                     : 8
					|memory-limit                        : 0
					|connections-limit                   : 128
					|safe-working-processes-memory-limit : 0
					|safe-call-memory-limit              : 0
					|cluster-port                        : 1541
					|
					|";

	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_СерверыСписок()

Функция Вывод_СерверыПараметры()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("server");
	ПараметрыЗапуска.Добавить("info");

	ПараметрыЗапуска.Добавить(СтрШаблон("--server=%1", Сервер_Ид()));
	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "server                              : " + Сервер_Ид() + "
					|agent-host                          : Sport1
					|agent-port                          : 1540
					|port-range                          : 1560:1591
					|name                                : ""Центральный сервер""
					|using                               : main
					|dedicate-managers                   : none
					|infobases-limit                     : 8
					|memory-limit                        : 0
					|connections-limit                   : 128
					|safe-working-processes-memory-limit : 0
					|safe-call-memory-limit              : 0
					|cluster-port                        : 1541
					|
					|";

Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_СерверыПараметры()

Функция Вывод_РабочиеПроцессыСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("process");
	ПараметрыЗапуска.Добавить("list");

	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "process              : 3ea9968d-159c-4b5f-9bdc-22b8ead96f74
					|host                 : Sport1
					|port                 : 1564
					|pid                  : 5428
					|is-enable            : yes
					|running              : yes
					|started-at           : 2018-03-29T11:16:02
					|use                  : used
					|available-perfomance : 100
					|capacity             : 1000
					|connections          : 7
					|memory-size          : 1518604
					|memory-excess-time   : 0
					|selection-size       : 61341
					|avg-back-call-time   : 0.000
					|avg-call-time        : 0.483
					|avg-db-call-time     : 0.124
					|avg-lock-call-time   : 0.000
					|avg-server-call-time : -0.265
					|avg-threads          : 0.281
					|
					|process              : 1af2e54f-d95a-4370-9b45-8277280cad23
					|host                 : Sport1
					|port                 : 1561
					|pid                  : 7856
					|is-enable            : yes
					|running              : yes
					|started-at           : 2018-04-03T18:42:45
					|use                  : used
					|available-perfomance : 100
					|capacity             : 1000
					|connections          : 19
					|memory-size          : 4598160
					|memory-excess-time   : 0
					|selection-size       : 169046
					|avg-back-call-time   : 0.000
					|avg-call-time        : 0.731
					|avg-db-call-time     : 0.140
					|avg-lock-call-time   : 0.000
					|avg-server-call-time : 0.133
					|avg-threads          : 2.088
					|
					|";

	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_РабочиеПроцессыСписок()

Функция Вывод_РабочиеПроцессыЛицензииСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("process");
	ПараметрыЗапуска.Добавить("info");

	ПараметрыЗапуска.Добавить("--licenses");

	ПараметрыЗапуска.Добавить(СтрШаблон("--process=%1", "3ea9968d-159c-4b5f-9bdc-22b8ead96f74"));

	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "process            : 3ea9968d-159c-4b5f-9bdc-22b8ead96f74
					|host               : Sport1
					|port               : 1564
					|pid                : 5428
					|full-name          : 
					|series             : ""EN8SA""
					|issued-by-server   : yes
					|license-type       : HASP
					|net                : no
					|max-users-all      : 1
					|max-users-cur      : 1
					|rmngr-address      : ""Sport1""
					|rmngr-port         : 1564
					|rmngr-pid          : 5428
					|short-presentation : ""Сервер, EN8SA Лок 1""
					|full-presentation  : ""Сервер, 5428, Sport1, 1564, EN8SA Локальный 1""
					|
					|";

	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_РабочиеПроцессыЛицензииСписок()

Функция Вывод_СервисыСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("service");
	ПараметрыЗапуска.Добавить("list");

	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "name      : LicenseService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис лицензирования""
					|
					|name      : EventLogService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис журналов регистрации""
					|
					|name      : OpenID2ProviderContextService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис провайдера OpenID2""
					|
					|name      : TimestampService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис времени""
					|
					|name      : SessionReuseService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис повторного использования сеансов""
					|
					|name      : SessionDataService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис сеансовых данных""
					|
					|name      : ExternalSessionManagerService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис внешнего управления сеансами""
					|
					|name      : FulltextSearchService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис полнотекстового поиска""
					|
					|name      : TransactionLockService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис транзакционных блокировок""
					|
					|name      : DebugService
					|main-only : 1
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис управления предметами отладки (TCP)""
					|
					|name      : ClusterConfigService
					|main-only : 1
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис конфигурации кластера""
					|
					|name      : ClientTestingService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис тестирования""
					|
					|name      : ClusterLockService
					|main-only : 1
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис блокировок кластера""
					|
					|name      : JobService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис заданий""
					|
					|name      : ExternalDataSourceXMLAService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис работы с внешними источниками данных через XMLA""
					|
					|name      : SettingsService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис пользовательских настроек""
					|
					|name      : ExternalDataSourceODBCService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис работы с внешними источниками данных через ODBC""
					|
					|name      : NumerationService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис нумерации""
					|
					|name      : DataEditLockService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис блокировки объектов""
					|
					|name      : AuxiliaryService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис вспомогательных функций кластера""
					|
					|name      : DataBaseConfigurationUpdateService
					|main-only : 0
					|manager   : 0e588a25-8354-4344-b935-53442312aa30
					|descr     : ""Сервис обновления конфигурации базы данных""
					|		
					|";

	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_СервисыСписок()

Функция Вывод_ИБСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("infobase");
	ПараметрыЗапуска.Добавить("summary");
	ПараметрыЗапуска.Добавить("list");

	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "infobase : feba16a9-3bb0-4fc9-b940-0f1ab933c539
					|name     : DEV_User1_ACC_Cust1
					|descr    : 
					|
					|infobase : aea71760-15b3-485a-9a35-506eb8a0b04a
					|name     : DEV_User1_TRADE_Cust1
					|descr    : 
					|
					|infobase : 7e468bc0-01f3-45d1-bed5-d5ec344aefb3
					|name     : DEV_User1_ACC_Cust2
					|descr    : 
					|
					|infobase : 76e63eea-c3d8-48d7-8e3c-ba80aaedbce9
					|name     : DEV_User2_TRADE_Cust2
					|descr    : 
					|
					|infobase : d8ee553b-9701-4d65-b385-599eaf1b3a54
					|name     : DEV_User3_ACC_Cust1
					|descr    : 
					|
					|";

	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_ИБСписок()

Функция Вывод_ИБСокращенныеПараметры()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("infobase");
	ПараметрыЗапуска.Добавить("summary");
	ПараметрыЗапуска.Добавить("info");

	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ПараметрыЗапуска.Добавить(СтрШаблон("--infobase=%1", "feba16a9-3bb0-4fc9-b940-0f1ab933c539"));
	ПараметрыЗапуска.Добавить("");
	
	ВыводКоманды = "infobase : feba16a9-3bb0-4fc9-b940-0f1ab933c539
					|name     : DEV_User1_ACC_Cust1
					|descr    : 
					|
					|";

	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_ИБСокращенныеПараметры()

Функция Вывод_ИБПолныеПараметры()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("infobase");
	ПараметрыЗапуска.Добавить("summary");
	ПараметрыЗапуска.Добавить("info");

	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ПараметрыЗапуска.Добавить(СтрШаблон("--infobase=%1", "feba16a9-3bb0-4fc9-b940-0f1ab933c539"));
	ПараметрыЗапуска.Добавить(ИБ_СтрокаАвторизации());
	
	ВыводКоманды = "infobase									: feba16a9-3bb0-4fc9-b940-0f1ab933c539
					|name										: DEV_User1_ACC_Cust1
					|dbms                                       : MSSQLServer
					|db-server                                  : Sport1
					|db-name                                    : DEV_User1_ACC_Cust1
					|db-user                                    : _1CSrvUsr1
					|security-level                             : 0
					|license-distribution                       : allow
					|scheduled-jobs-deny                        : on
					|sessions-deny                              : off
					|denied-from                                : 
					|denied-message                             : 
					|denied-parameter                           : 
					|denied-to                                  : 
					|permission-code                            : 
					|external-session-manager-connection-string : 
					|external-session-manager-required          : no
					|security-profile-name                      : 
					|safe-mode-security-profile-name            : 
					|descr                                      : 
					|
					|";

	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_ИБПолныеПараметры()

Функция Вывод_ИБНедостаточноПрав()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("infobase");
	ПараметрыЗапуска.Добавить("info");

	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ПараметрыЗапуска.Добавить(СтрШаблон("--infobase=%1", "feba16a9-3bb0-4fc9-b940-0f1ab933c539"));
	ПараметрыЗапуска.Добавить("");
	
	ВыводКоманды = "Недостаточно прав пользователя";

	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_ИБПолныеПараметры()

Функция Вывод_СеансыСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("session");
	ПараметрыЗапуска.Добавить("list");

	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "session                          : 1fb5f037-99e8-4924-a99d-a9e687522d32
					|session-id                       : 1
					|infobase                         : aea71760-15b3-485a-9a35-506eb8a0b04a
					|connection                       : 8adf4514-0379-4333-a153-0b2689edc415
					|process                          : 1af2e54f-d95a-4370-9b45-8277280cad23
					|user-name                        : 1C Artem Kuznetsov
					|host                             : Sport1
					|app-id                           : Designer
					|locale                           : ru_RU
					|started-at                       : 2018-04-09T14:51:31
					|last-active-at                   : 2018-05-14T11:12:33
					|hibernate                        : no
					|passive-session-hibernate-time   : 1200
					|hibernate-session-terminate-time : 86400
					|blocked-by-dbms                  : 0
					|blocked-by-ls                    : 0
					|bytes-all                        : 105972550
					|bytes-last-5min                  : 0
					|calls-all                        : 119052
					|calls-last-5min                  : 0
					|dbms-bytes-all                   : 317824922
					|dbms-bytes-last-5min             : 0
					|db-proc-info                     : 
					|db-proc-took                     : 0
					|db-proc-took-at                  : 
					|duration-all                     : 66184
					|duration-all-dbms                : 43242
					|duration-current                 : 0
					|duration-current-dbms            : 0
					|duration-last-5min               : 0
					|duration-last-5min-dbms          : 0
					|
					|session                          : 451581eb-4020-4c3c-87f6-5512676bf97d
					|session-id                       : 1
					|infobase                         : 76e63eea-c3d8-48d7-8e3c-ba80aaedbce9
					|connection                       : 1976200b-6b2f-4f6d-bc21-7aea57924330
					|process                          : 1af2e54f-d95a-4370-9b45-8277280cad23
					|user-name                        : Ворсин Тимофей
					|host                             : Sport1
					|app-id                           : Designer
					|locale                           : ru_RU
					|started-at                       : 2018-04-28T12:22:26
					|last-active-at                   : 2018-05-14T11:13:55
					|hibernate                        : no
					|passive-session-hibernate-time   : 1200
					|hibernate-session-terminate-time : 86400
					|blocked-by-dbms                  : 0
					|blocked-by-ls                    : 0
					|bytes-all                        : 49614860
					|bytes-last-5min                  : 0
					|calls-all                        : 153920
					|calls-last-5min                  : 0
					|dbms-bytes-all                   : 338050537
					|dbms-bytes-last-5min             : 0
					|db-proc-info                     : 
					|db-proc-took                     : 0
					|db-proc-took-at                  : 
					|duration-all                     : 496230
					|duration-all-dbms                : 375412
					|duration-current                 : 0
					|duration-current-dbms            : 0
					|duration-last-5min               : 0
					|duration-last-5min-dbms          : 0
					|
					|session                          : 6c785f29-c7af-4aab-bbf0-8ba25909b6bf
					|session-id                       : 2
					|infobase                         : 76e63eea-c3d8-48d7-8e3c-ba80aaedbce9
					|connection                       : 86ab876a-8382-4b26-b8e8-ec0bbb8424a6
					|process                          : 1af2e54f-d95a-4370-9b45-8277280cad23
					|user-name                        : Ворсин Тимофей
					|host                             : Sport1
					|app-id                           : 1CV8
					|locale                           : ru
					|started-at                       : 2018-05-07T11:56:39
					|last-active-at                   : 2018-05-14T11:11:34
					|hibernate                        : no
					|passive-session-hibernate-time   : 1200
					|hibernate-session-terminate-time : 86400
					|blocked-by-dbms                  : 0
					|blocked-by-ls                    : 0
					|bytes-all                        : 33494250
					|bytes-last-5min                  : 16403
					|calls-all                        : 237248
					|calls-last-5min                  : 116
					|dbms-bytes-all                   : 26412110
					|dbms-bytes-last-5min             : 240
					|db-proc-info                     : 
					|db-proc-took                     : 0
					|db-proc-took-at                  : 
					|duration-all                     : 60280
					|duration-all-dbms                : 19420
					|duration-current                 : 0
					|duration-current-dbms            : 0
					|duration-last-5min               : 0
					|duration-last-5min-dbms          : 0
					|
					|session                          : 6d7f9a69-8168-45be-bbc1-c4ab0b4629dd
					|session-id                       : 1
					|infobase                         : feba16a9-3bb0-4fc9-b940-0f1ab933c539
					|connection                       : fb66a9a1-d098-4b20-9eae-63c477d6ee81
					|process                          : 3ea9968d-159c-4b5f-9bdc-22b8ead96f74
					|user-name                        : 1C Artem Kuznetsov
					|host                             : Sport1
					|app-id                           : Designer
					|locale                           : ru_RU
					|started-at                       : 2018-05-11T10:36:38
					|last-active-at                   : 2018-05-14T11:11:41
					|hibernate                        : no
					|passive-session-hibernate-time   : 1200
					|hibernate-session-terminate-time : 86400
					|blocked-by-dbms                  : 0
					|blocked-by-ls                    : 0
					|bytes-all                        : 249401429
					|bytes-last-5min                  : 0
					|calls-all                        : 180420
					|calls-last-5min                  : 0
					|dbms-bytes-all                   : 153968974
					|dbms-bytes-last-5min             : 0
					|db-proc-info                     : 
					|db-proc-took                     : 0
					|db-proc-took-at                  : 
					|duration-all                     : 57552
					|duration-all-dbms                : 37076
					|duration-current                 : 0
					|duration-current-dbms            : 0
					|duration-last-5min               : 0
					|duration-last-5min-dbms          : 0
					|
					|session                          : 877a29b9-be0a-46fd-adce-44949bcaf72b
					|session-id                       : 2
					|infobase                         : aea71760-15b3-485a-9a35-506eb8a0b04a
					|connection                       : 00000000-0000-0000-0000-000000000000
					|process                          : 00000000-0000-0000-0000-000000000000
					|user-name                        : 1C Artem Kuznetsov
					|host                             : 
					|app-id                           : 1CV8C
					|locale                           : ru
					|started-at                       : 2018-05-13T11:50:35
					|last-active-at                   : 2018-05-14T11:13:08
					|hibernate                        : no
					|passive-session-hibernate-time   : 1200
					|hibernate-session-terminate-time : 86400
					|blocked-by-dbms                  : 0
					|blocked-by-ls                    : 0
					|bytes-all                        : 3415895
					|bytes-last-5min                  : 17272
					|calls-all                        : 3164
					|calls-last-5min                  : 15
					|dbms-bytes-all                   : 10307424
					|dbms-bytes-last-5min             : 50900
					|db-proc-info                     : 
					|db-proc-took                     : 0
					|db-proc-took-at                  : 
					|duration-all                     : 83008
					|duration-all-dbms                : 27875
					|duration-current                 : 0
					|duration-current-dbms            : 0
					|duration-last-5min               : 170
					|duration-last-5min-dbms          : 30
					|
					|";

	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_СеансыСписок()

Функция Вывод_СеансыЛицензииСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("session");
	ПараметрыЗапуска.Добавить("info");

	ПараметрыЗапуска.Добавить("--licenses");

	ПараметрыЗапуска.Добавить(СтрШаблон("--session=%1", "1fb5f037-99e8-4924-a99d-a9e687522d32"));

	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "session            : 1fb5f037-99e8-4924-a99d-a9e687522d32
					|user-name          : 1C Artem Kuznetsov
					|host               : Sport1
					|app-id             : Designer
					|full-name          : 
					|series             : ""ORGL8""
					|issued-by-server   : no
					|license-type       : HASP
					|net                : no
					|max-users-all      : 100
					|max-users-cur      : 100
					|rmngr-address      : 
					|rmngr-port         : 0
					|rmngr-pid          : 6212
					|short-presentation : ""Клиент, ORGL8 Лок 100""
					|full-presentation  : ""Клиент, 6212, ORGL8 Локальный 100""
					|
					|";

	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_СеансыЛицензииСписок()

Функция Вывод_СоединенияСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("connection");
	ПараметрыЗапуска.Добавить("list");

	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "connection     : 1976200b-6b2f-4f6d-bc21-7aea57924330
					|conn-id        : 1753098
					|host           : Sport1
					|process        : 1af2e54f-d95a-4370-9b45-8277280cad23
					|infobase       : 76e63eea-c3d8-48d7-8e3c-ba80aaedbce9
					|application    : ""Designer""
					|connected-at   : 2018-05-07T11:56:31
					|session-number : 1
					|blocked-by-ls  : 0
					|
					|connection     : 8adf4514-0379-4333-a153-0b2689edc415
					|conn-id        : 947282
					|host           : Sport1
					|process        : 1af2e54f-d95a-4370-9b45-8277280cad23
					|infobase       : aea71760-15b3-485a-9a35-506eb8a0b04a
					|application    : ""Designer""
					|connected-at   : 2018-04-18T16:17:57
					|session-number : 1
					|blocked-by-ls  : 0
					|
					|connection     : 2f5c0a21-65d1-4af2-8a29-3019957a16c3
					|conn-id        : 0
					|host           : Sport1
					|process        : 1af2e54f-d95a-4370-9b45-8277280cad23
					|infobase       : 00000000-0000-0000-0000-000000000000
					|application    : ""Debugger""
					|connected-at   : 2018-05-07T11:56:39
					|session-number : 0
					|blocked-by-ls  : 0
					|
					|connection     : fa82e322-e566-4975-a1e7-ff4d7331048f
					|conn-id        : 0
					|host           : Sport1
					|process        : 1af2e54f-d95a-4370-9b45-8277280cad23
					|infobase       : 00000000-0000-0000-0000-000000000000
					|application    : ""Debugger""
					|connected-at   : 2018-05-14T11:11:20
					|session-number : 0
					|blocked-by-ls  : 0
					|
					|connection     : 34094f2e-e8f4-476d-a263-324da359ac73
					|conn-id        : 0
					|host           : Sport1
					|process        : 1af2e54f-d95a-4370-9b45-8277280cad23
					|infobase       : 00000000-0000-0000-0000-000000000000
					|application    : ""JobScheduler""
					|connected-at   : 2018-04-03T18:42:45
					|session-number : 0
					|blocked-by-ls  : 0
					|
					|connection     : b526a131-d9fa-4bb0-9d6d-94c4f3414912
					|conn-id        : 0
					|host           : Sport1
					|process        : 1af2e54f-d95a-4370-9b45-8277280cad23
					|infobase       : 00000000-0000-0000-0000-000000000000
					|application    : ""JobScheduler""
					|connected-at   : 2018-04-20T16:33:33
					|session-number : 0
					|blocked-by-ls  : 0
					|
					|connection     : 00488442-84bc-4d0f-b568-f9f4f7419211
					|conn-id        : 0
					|host           : Sport1
					|process        : 1af2e54f-d95a-4370-9b45-8277280cad23
					|infobase       : 00000000-0000-0000-0000-000000000000
					|application    : ""JobScheduler""
					|connected-at   : 2018-04-03T18:42:45
					|session-number : 0
					|blocked-by-ls  : 0
					|
					|connection     : 82bd7e49-a949-44a6-acda-a57288a18e49
					|conn-id        : 0
					|host           : Sport1
					|process        : 1af2e54f-d95a-4370-9b45-8277280cad23
					|infobase       : 00000000-0000-0000-0000-000000000000
					|application    : ""Debugger""
					|connected-at   : 2018-04-23T11:42:47
					|session-number : 0
					|blocked-by-ls  : 0
					|
					|connection     : 86ab876a-8382-4b26-b8e8-ec0bbb8424a6
					|conn-id        : 1753103
					|host           : Sport1
					|process        : 1af2e54f-d95a-4370-9b45-8277280cad23
					|infobase       : 76e63eea-c3d8-48d7-8e3c-ba80aaedbce9
					|application    : ""1CV8""
					|connected-at   : 2018-05-07T11:56:39
					|session-number : 2
					|blocked-by-ls  : 0
					|
					|connection     : 33786cb6-8cf0-4c83-b5b5-d92a6f6b7811
					|conn-id        : 0
					|host           : Sport1
					|process        : 1af2e54f-d95a-4370-9b45-8277280cad23
					|infobase       : 00000000-0000-0000-0000-000000000000
					|application    : ""Debugger""
					|connected-at   : 2018-05-13T11:50:36
					|session-number : 0
					|blocked-by-ls  : 0
					|
					|connection     : 0873a8f8-e90e-4685-bcdd-f8b8d01e68ba
					|conn-id        : 0
					|host           : Sport1
					|process        : 1af2e54f-d95a-4370-9b45-8277280cad23
					|infobase       : 7e468bc0-01f3-45d1-bed5-d5ec344aefb3
					|application    : ""BackgroundJob""
					|connected-at   : 2018-05-14T11:15:28
					|session-number : 0
					|blocked-by-ls  : 0
					|
					|connection     : 4170b8f9-ee6f-4328-bb30-54358a98e439
					|conn-id        : 1994474
					|host           : Sport1
					|process        : 1af2e54f-d95a-4370-9b45-8277280cad23
					|infobase       : aea71760-15b3-485a-9a35-506eb8a0b04a
					|application    : ""1CV8C""
					|connected-at   : 2018-05-13T11:50:32
					|session-number : 0
					|blocked-by-ls  : 0
					|
					|connection     : 33bd020f-fc2b-49d8-9256-b38a22d66e6e
					|conn-id        : 0
					|host           : Sport1
					|process        : 3ea9968d-159c-4b5f-9bdc-22b8ead96f74
					|infobase       : 00000000-0000-0000-0000-000000000000
					|application    : ""JobScheduler""
					|connected-at   : 2018-05-14T11:14:24
					|session-number : 0
					|blocked-by-ls  : 0
					|
					|connection     : fb66a9a1-d098-4b20-9eae-63c477d6ee81
					|conn-id        : 1912040
					|host           : Sport1
					|process        : 3ea9968d-159c-4b5f-9bdc-22b8ead96f74
					|infobase       : feba16a9-3bb0-4fc9-b940-0f1ab933c539
					|application    : ""Designer""
					|connected-at   : 2018-05-11T10:36:24
					|session-number : 1
					|blocked-by-ls  : 0
					|
					|connection     : 28d147ce-2934-4d28-84b5-6b84328f7ac6
					|conn-id        : 0
					|host           : Sport1
					|process        : 3ea9968d-159c-4b5f-9bdc-22b8ead96f74
					|infobase       : 00000000-0000-0000-0000-000000000000
					|application    : ""SrvrConsole""
					|connected-at   : 2018-04-19T12:15:59
					|session-number : 0
					|blocked-by-ls  : 0
					|
					|";

	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_СоединенияСписок()

Функция Вывод_НазначенияФункциональностиСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("rule");
	ПараметрыЗапуска.Добавить("list");

	ПараметрыЗапуска.Добавить(СтрШаблон("--server=%1", Сервер_Ид()));
	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "rule            : 2aae9067-8fff-4aa7-a87b-e9c354879029
					|object-type     : ""Connection""
					|infobase-name   : DEV_User1_TRADE_Cust1
					|rule-type       : always
					|application-ext : 
					|priority        : 0
					|
					|rule            : 269f9796-a3fa-4370-ae56-558a5d00d6c0
					|object-type     : 
					|infobase-name   : DEV_User2_TRADE_Cust2
					|rule-type       : auto
					|application-ext : BacgroundJob
					|priority        : 0
					|
					|";

	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_НазначенияФункциональностиСписок()

Функция Вывод_НазначенияФункциональностиПараметры()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("rule");
	ПараметрыЗапуска.Добавить("info");

	ПараметрыЗапуска.Добавить(СтрШаблон("--server=%1", Сервер_Ид()));
	
	ПараметрыЗапуска.Добавить(СтрШаблон("--rule=%1", "2aae9067-8fff-4aa7-a87b-e9c354879029"));

	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "rule            : 2aae9067-8fff-4aa7-a87b-e9c354879029
					|object-type     : ""Connection""
					|infobase-name   : DEV_User1_TRADE_Cust1
					|rule-type       : always
					|application-ext : 
					|priority        : 0
					|
					|";

	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_НазначенияФункциональностиПараметры()

Функция Вывод_ПрофилиБезопасностиСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());
	
	ПараметрыЗапуска.Добавить("profile");
	ПараметрыЗапуска.Добавить("list");
	
	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());
	
	ВыводКоманды = "name                                : ОсновнойПрофиль
					|descr                               : Основной профиль безопасности
					|config                              : no
					|priv                                : no
					|directory                           : list
					|com                                 : list
					|addin                               : list
					|module                              : list
					|app                                 : list
					|inet                                : list
					|crypto                              : no
					|right-extension                     : no
					|right-extension-definition-roles    : 
					|all-modules-extension               : no
					|modules-available-for-extension     : 
					|modules-not-available-for-extension : 
					|
					|";
	
	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_ПрофилиБезопасностиСписок()

Функция Вывод_ПрофилиБезопасностиКаталогиСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("profile");
	ПараметрыЗапуска.Добавить("acl");
	ПараметрыЗапуска.Добавить(Перечисления.ВидыОбъектовПрофиляБезопасности.Каталог);
	ПараметрыЗапуска.Добавить("list");

	ПараметрыЗапуска.Добавить(СтрШаблон("--name=%1", ПрофильБезопасности_Имя()));
	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "alias        : Каталог1
					|descr        : 
					|physicalPath : 
					|allowedRead  : no
					|allowedWrite : no
					|
					|";
	
	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_ПрофилиБезопасностиКаталогиСписок()

Функция Вывод_ПрофилиБезопасностиCOMКлассыСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("profile");
	ПараметрыЗапуска.Добавить("acl");
	ПараметрыЗапуска.Добавить(Перечисления.ВидыОбъектовПрофиляБезопасности.COMКласс);
	ПараметрыЗапуска.Добавить("list");

	ПараметрыЗапуска.Добавить(СтрШаблон("--name=%1", ПрофильБезопасности_Имя()));
	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "name     : КОМКласс1
					|descr    : 
					|fileName : 
					|id       : 00000000-0000-0000-0000-000000000000
					|host     : 
					|
					|";
	
	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_ПрофилиБезопасностиCOMКлассыСписок()

Функция Вывод_ПрофилиБезопасностиКомпонентыСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("profile");
	ПараметрыЗапуска.Добавить("acl");
	ПараметрыЗапуска.Добавить(Перечисления.ВидыОбъектовПрофиляБезопасности.Компонент);
	ПараметрыЗапуска.Добавить("list");

	ПараметрыЗапуска.Добавить(СтрШаблон("--name=%1", ПрофильБезопасности_Имя()));
	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "name  : Компонент 1
					|descr : 
					|hash  : iaKOwtd6TRHQHOq5dTaAQA==
					|
					|";
	
	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_ПрофилиБезопасностиКаталогиСписок()

Функция Вывод_ПрофилиБезопасностиМодулиСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("profile");
	ПараметрыЗапуска.Добавить("acl");
	ПараметрыЗапуска.Добавить(Перечисления.ВидыОбъектовПрофиляБезопасности.Модуль);
	ПараметрыЗапуска.Добавить("list");

	ПараметрыЗапуска.Добавить(СтрШаблон("--name=%1", ПрофильБезопасности_Имя()));
	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "name  : Модуль 1
					|descr : 
					|hash  : iaKOwtd6TRHQHOq5dTaAQA==
					|
					|";
	
	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_ПрофилиБезопасностиМодулиСписок()

Функция Вывод_ПрофилиБезопасностиПриложенияСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("profile");
	ПараметрыЗапуска.Добавить("acl");
	ПараметрыЗапуска.Добавить(Перечисления.ВидыОбъектовПрофиляБезопасности.Приложение);
	ПараметрыЗапуска.Добавить("list");

	ПараметрыЗапуска.Добавить(СтрШаблон("--name=%1", ПрофильБезопасности_Имя()));
	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "name  : Приложение1
					|descr : 
					|wild  : 
					|
					|";
	
	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_ПрофилиБезопасностиПриложенияСписок()

Функция Вывод_ПрофилиБезопасностиИнтернетРесурсыСписок()
	
	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Агент_СтрокаПодключения());

	ПараметрыЗапуска.Добавить("profile");
	ПараметрыЗапуска.Добавить("acl");
	ПараметрыЗапуска.Добавить(Перечисления.ВидыОбъектовПрофиляБезопасности.ИнтернетРесурс);
	ПараметрыЗапуска.Добавить("list");

	ПараметрыЗапуска.Добавить(СтрШаблон("--name=%1", ПрофильБезопасности_Имя()));
	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Ид()));
	ПараметрыЗапуска.Добавить(Кластер_СтрокаАвторизации());

	ВыводКоманды = "name     : ИнтернетРесурс1
					|descr    : 
					|protocol : 
					|url      : 
					|port     : 0
					|
					|";
	
	Возврат Новый Структура("ПараметрыКоманды, ВыводКоманды", ПараметрыЗапуска, ВыводКоманды);

КонецФункции // Вывод_ПрофилиБезопасностиИнтернетРесурсыСписок()

Процедура Инициализация()
	
	Лог = Логирование.ПолучитьЛог("ktb.lib.irac");

	ПараметрыКластера = Новый Структура();
	
	ПараметрыКластера.Вставить("Кластеры",
		Новый Структура("Список, Параметры, Добавить, Изменить, Удалить",
						Вывод_КластерыСписок(),
						Вывод_КластерыПараметры(),
						Неопределено,
						Неопределено,
						Неопределено));

	ПараметрыКластера.Вставить("Менеджеры",
		Новый Структура("Список, Параметры",
						Вывод_МенеджерыСписок(),
						Неопределено));

	ПараметрыКластера.Вставить("Серверы",
		Новый Структура("Список, Параметры, Добавить, Изменить, Удалить",
						Вывод_СерверыСписок(),
						Вывод_СерверыПараметры(),
						Неопределено,
						Неопределено,
						Неопределено));

	ПараметрыКластера.Вставить("РабочиеПроцессы",
		Новый Структура("Список, Параметры, Лицензии",
						Вывод_РабочиеПроцессыСписок(),
						Неопределено));
	ПараметрыКластера.РабочиеПроцессы.Лицензии	= Новый Структура("Список", Вывод_РабочиеПроцессыЛицензииСписок());


	ПараметрыКластера.Вставить("Сервисы",
		Новый Структура("Список, Параметры",
						Вывод_СервисыСписок(),
						Неопределено));

	ПараметрыКластера.Вставить("Сеансы",
		Новый Структура("Список, Параметры, Лицензии",
						Вывод_СеансыСписок(),
						Неопределено));
	ПараметрыКластера.Сеансы.Лицензии	= Новый Структура("Список", Вывод_СеансыЛицензииСписок());

	ПараметрыКластера.Вставить("Соединения",
		Новый Структура("Список, Параметры",
						Вывод_СоединенияСписок(),
						Неопределено));

	ПараметрыКластера.Вставить("ИБ",
		Новый Структура("Список, СокращенныеПараметры, ПолныеПараметры, НедостаточноПрав, Добавить, Изменить, Удалить",
						Вывод_ИБСписок(),
						Вывод_ИБСокращенныеПараметры(),
						Вывод_ИБПолныеПараметры(),
						Вывод_ИБНедостаточноПрав(),
						Неопределено,
						Неопределено,
						Неопределено));

	ПараметрыКластера.Вставить("НазначенияФункциональности",
		Новый Структура("Список, Параметры, Добавить, Изменить, Удалить",
						Вывод_НазначенияФункциональностиСписок(),
						Вывод_НазначенияФункциональностиПараметры(),
						Неопределено,
						Неопределено,
						Неопределено));

	СтруктураПрофилей = Новый Структура("Список,
										|Параметры,
										|Добавить,
										|Изменить,
										|Удалить,
										|Каталоги,
										|COMКлассы,
										|Компоненты,
										|Модули,
										|Приложения,
										|ИнтернетРесурсы");

	СтруктураПрофилей.Список			= Вывод_ПрофилиБезопасностиСписок();
	СтруктураПрофилей.Каталоги			= Новый Структура("Список, Параметры", Вывод_ПрофилиБезопасностиКаталогиСписок());
	СтруктураПрофилей.COMКлассы			= Новый Структура("Список, Параметры", Вывод_ПрофилиБезопасностиCOMКлассыСписок());
	СтруктураПрофилей.Компоненты		= Новый Структура("Список, Параметры", Вывод_ПрофилиБезопасностиКомпонентыСписок());
	СтруктураПрофилей.Модули			= Новый Структура("Список, Параметры", Вывод_ПрофилиБезопасностиМодулиСписок());
	СтруктураПрофилей.Приложения		= Новый Структура("Список, Параметры", Вывод_ПрофилиБезопасностиПриложенияСписок());
	СтруктураПрофилей.ИнтернетРесурсы	= Новый Структура("Список, Параметры", Вывод_ПрофилиБезопасностиИнтернетРесурсыСписок());
	
	ПараметрыКластера.Вставить("ПрофилиБезопасности", СтруктураПрофилей);

КонецПроцедуры // Инициализация()

Инициализация();