//
//  AppDelegate.m
//  Powercom
//
//  Created by daniel on 2015/7/24.
//  Copyright (c) 2015年 daniel. All rights reserved.
//

#import "AppDelegate.h"
#import "AMSmoothAlertView.h"
#import "MPNotificationView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // Assign tab bar item with titles
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UITabBar *tabBar = tabBarController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
    
//    tabBarItem1.title = @"Home";
//    tabBarItem2.title = @"Maps";
//    tabBarItem3.title = @"My Plan";
//    tabBarItem4.title = @"Settings";
    
    
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    
    //[tabBarItem1 initWithTitle:@"123" image:@"p1" tag:0];
    [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@"p1_selected.png"] withFinishedUnselectedImage:nil];//[UIImage imageNamed:@"p1.png"]
    [tabBarItem2 setFinishedSelectedImage:[UIImage imageNamed:@"p2_selected.png"] withFinishedUnselectedImage:nil];//[UIImage imageNamed:@"p2.png"]
    [tabBarItem3 setFinishedSelectedImage:[UIImage imageNamed:@"p3_selected.png"] withFinishedUnselectedImage:nil];//[UIImage imageNamed:@"p3.png"]
    [tabBarItem4 setFinishedSelectedImage:[UIImage imageNamed:@"p4_selected.png"] withFinishedUnselectedImage:nil];//[UIImage imageNamed:@"p4.png"]

    
    /*
    //開始//
    
    NSLog(@"open");
    
    global.globalData = [[NSMutableArray alloc] initWithCapacity:300];
    global.PRO_now = true;
    global.SNMP_now = true;
    global.IP = nil;
    global.Password_correct = false;
    _disconnect_timer_counter = 0;
    disconnect_flag = true;
    global.language_now_is = 2;
    
    udpSocket = [[AsyncUdpSocket alloc] initWithDelegate:self];
    NSError *error = nil;
    [udpSocket bindToPort:2601 error:&error]; //綁定一個port 讓發送的source port / 指定接收的port 都是這一個
    [udpSocket receiveWithTimeout:-1 tag:0];//Start listening for a UDP packet.
    
    NSString *store_ip = [userDefaults stringForKey:@"store IP"];
    NSLog(@"Store ip =%@",store_ip);
    global.IP = store_ip;
    if (store_ip == nil) {
        //連線
        UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(12, 50, 260, 100)];
        [textView setText:@""];
        textView.tag =10;
        init_pop_ip = [[UIAlertView alloc]initWithTitle:@"Input Target IP:" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Enter",nil];
        init_pop_ip.alertViewStyle = UIAlertViewStylePlainTextInput;
        [init_pop_ip addSubview:textView];
        [init_pop_ip show];
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(sender) userInfo:nil repeats:YES];
    disconnect_timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(disconnect_dectect) userInfo:nil repeats:YES];
    */
    
    //預設語言
    NSString *path = [[NSBundle mainBundle] pathForResource:@"en_update" ofType:@"plist"];//_update
    NSDictionary *rootDictionary =[[NSDictionary alloc] initWithContentsOfFile:path];
    
    
    global.language_en = [NSArray arrayWithObjects:
                          /*1-10*/@"Input Voltage",@"Output Voltage", @"Battery Capacity", @"Load", @"Input Voltage (V)",@"Output Voltage (V)", @"Load (%)", @"Battery Level (%)", @"Battery Backup Time (Min)", @"Battery Status",
                          
                          /*11-20*/@"Battery Fail",@"Battery Low",@"Normal",@"Charge",@"Discharge",@"Battery Test",@"Test Complete", @"UPS Status",@"UPS Fail",@"UPS Overload",
                          /*21-30*/@"On Line",@"Bypass",@"Normal",@"AVR Boost",@"AVR Buck",@"Power Status ",@"Utility Power", @"Battery Power",@"Battery Test",@"Test Complete",
                          /*31-40*/@"UPS is working normally",@"UPS is working on battery",@"UPS Disconnect",@"UPS Reconnect",@"PRO Disconnect",@"PRO Reconnect",@"Power Failure", @"Power Restore",@"Connect",@"Language",
                          /*41-50*/@"Battery Test",@"Control",@"Historical Event",@"PRO",@"SNMP",@"Loading",@"Input Target IP", @"Enter",@"Cancel",@"Password",
                          /*51-60*/@"Verifying",@"Password Accept",@"Password Error",@"Outlet 1 Control",@"Outlet 2 Control",@"PC Shutdown",@"PC Reboot", @"UPS Reboot",@"Warning!",@"Password Necessary",
                          /*61-70*/@"Outlet 1 will be ON!",@"Outlet 1 will be OFF!",@"Outlet 2 will be ON!",@"Outlet 2 will be OFF!",@"PC will shutdown!",@"PC will reboot!",@"UPS will reboot!", @"Save IP",@"ON",@"OFF",nil];
    
    NSLog(@" language = %@",[global.language_en objectAtIndex:1]);
    
    global.language_it = [NSArray arrayWithObjects:
                          /*1-10*/@"Tensione Ingresso",@"Tensione Uscita", @"Capacità Batteria", @"Carico", @"Tensione Ingresso (V)", @"Tensione Uscita (V)", @"Carico (%)", @"Livello Batteria (%)", @"Autonomia (min)",@"Stato Batteria",
                          /*11-20*/@"Guasto Batteria", @"Batteria Scarica", @"Normale", @"In Carica", @"Scarica", @"Test Batteria", @"Test Completato", @"Stato UPS",@"UPS Guasto",@"Sovraccarico UPS",
                          /*21-30*/@"On Line",@"Bypass", @"Normale", @"AVR Boost", @"AVR Buck", @"Stato Rete", @"Potenza Rete", @"Potenza Batteria", @"Test Batteria", @"Test Completato",
                          /*31-40*/@"L'UPS funziona correttamente",@"L'UPS funziona da Batteria", @"UPS Disconnesso", @"Riconnetti UPS", @"PRO Disconnesso", @"Riconnetti PRO", @"Rete Assente", @"Rete Ripristinata", @"Connetti", @"Lingua",
                          /*41-50*/@"Test Batteria",@"Gestione", @"Cronologia Eventi", @"PRO", @"SNMP", @"Caricamento", @"Inserire Indirizzo IP", @"Entra", @"Cancella", @"Password",
                          /*51-60*/@"Verifica",@"Password Accettata", @"Password Errata", @"Gestisci Uscita 1", @"Gestisci Uscita 2", @"Spegni PC", @"Riavvia PC", @"Riavvia UPS", @"Attenzione!", @"Password Necessaria",
                          /*61-70*/@"L'Uscita 1 si accenderà!",@"L'Uscita 1 si spegnerà!", @"L'Uscita 2 si accenderà!", @"L'Uscita 2 si spegnerà!", @"Il PC si spegnerà!", @"Il PC si riavvierà!", @"L'UPS si riavvierà!", @"Salva IP", @"ON", @"OFF",nil];
    
    
    global.language_de = [NSArray arrayWithObjects:
                          /*1-10*/ @"Eingangsspannung",@"Ausgangsspannung", @"Batteriekapazität", @"Last", @"Eingangsspannung (V)", @"Ausgangsspannung (V)", @"Last (%)", @"Batteriekapazität (%)", @"Autonomiezeit (Min.)",@"Batteriestatus",
                          /*11-20*/@"Batteriefehler",@"Batteriekapazität geht zu Ende", @"Normal", @"Ladung", @"Entladung", @"Batterietest", @"Test fertig", @"USV Status", @"USV Fehler",@"USV Überlast",
                          /*21-30*/@"Online",@"Bypass", @"Normal", @"AVR Boost", @"AVR Buck", @"Netzstatus", @"Netzstrom", @"Batterieleistung", @"Batterietest",@"Test fertig",
                          /*31-40*/@"USV arbeitet im Netzbetrieb",@"USV arbeitet im Batteriebetrieb", @"keine Verbindung zur USV", @"Verbindung zur USV hergestellt", @"keine Verbindung zur Software PRO", @"Verbindung zur Software PRO hergestellt", @"Netzfehler", @"Netzwiederkehr", @"Verbunden",@"Sprache",
                          /*41-50*/@"Batterietest",@"USV Funktionen", @"Events", @"PRO", @"SNMP", @"wird geladen", @"Eingabe IP-Adresse", @"Eingabe", @"Abbruch",@"Passwort",
                          /*51-60*/@"überprüfen",@"Passwort korrekt", @"Passwort ist falsch", @"Kontrolle Ausgang 1", @"Kontrolle Ausgang 2", @"PC herunterfahren", @"PC Reboot", @"USV Reboot", @"Warnung !",@"Passwort wird benötigt",
                          /*61-70*/@"Ausgang 1 wird eingeschaltet",@"Ausgang 1 wird ausgeschaltet", @"Ausgang 2 wird eingeschaltet", @"Ausgang 2 wird ausgeschaltet", @"PC wird heruntergefahren", @"PC wird wieder hochgefahren", @"USV wird wieder eingeschaltet", @"Sichere IP-Adresse", @"Eingabe",@"Aus",nil];
    
    global.language_fr = [NSArray arrayWithObjects:
                          /*1-10*/ @"Tension Entrée",@"Tension Sortie", @"Capacité batterie", @"Charge ", @"Tension Entrée (V)", @"Tension Sortie (V)", @"Charge (%)", @"Niveau Batterie (%)", @"Auntonomie (min)",@"Etat batterie",
                          /*11-20*/@"Défaut batterie",@"Batterie déchargée", @"Normal", @"En charge", @"En décharge", @"Test Batterie", @"Test terminé", @"Etat ASI", @"Défaut onduleur",@"Surcharge onduleur",
                          /*21-30*/@"On Line",@"By-pass", @"Normal", @"AVR Boost", @"AVR Buck", @"Etat du réseau", @"Puissance utilisation", @"Puissance batterie", @"Test batterie",@"Test terminé",
                          /*31-40*/@"L'onduleur fonctionne normalement",@"Fonctionnement sur batterie", @"Onduleur déconnecté", @"Reconnecter l'onduleur", @"PRO???", @"Reconnecter PRO", @"Défaut alimentation", @"Démarrage réseau", @"Connecté",@"Language",
                          /*41-50*/@"Test batterie",@"Gestion", @"Historique Evènement", @"PRO", @"SNMP", @"Charge connectée", @"Insérez l'adresse IP", @"Enter", @"Annuler",@"Mot de passe",
                          /*51-60*/@"Vérification",@"Mot de passe accepté", @"Erreur mot de passe", @"Gestion sortie 1", @"Gestion sortie 2", @"Extinction PC", @"Démarrage PC", @"Démarrage onduleur", @"Attention!",@"Mot de passe nécessaire",
                          /*61-70*/@"La sortie 1 s'active",@"La sortie 1 s'arrête", @"La sortie 2 s'active", @"La sortie 2 s'arrête", @"Le PC va s'arrêter", @"Le PC va redémarrer", @"L'onduleur va redémarrer", @"Sauvegarde IP", @"Marche",@"Arrêt",nil];
    
    global.language_pr = [NSArray arrayWithObjects:
                          /*1-10*/ @"Tensão de Entrada",@"Tensão de Saída", @"Capacidade da Bateria", @"Carga", @"Tensão de Entrada (V)", @"Tensão de Saída (V)", @"Carga (%)", @"Nível da Bateria (%)", @"Autonomia (min)",@"Estado da Bateria",
                          /*11-20*/@"Falha da Bateria",@"Bateria com carga baixa", @"Normal", @"Em carga", @"Descarga", @"Teste da Bateria", @"Teste Completo", @"Estado da UPS", @"Falha da UPS",@"UPS em Sobrecarga",
                          /*21-30*/@"Online",@"Bypass", @"Normal", @"AVR Boost", @"AVR Buck", @"Estado da Rede", @"Rede Geral", @"Potência da Bateria", @"Teste da Bateria",@"Teste Completo",
                          /*31-40*/@"A UPS está a operar correctamente",@"A UPS está a operar a partir da bateria", @"UPS desconectada", @"UPS reconectada", @"PRO desconectada", @"PRO reconectada", @"Falha de rede", @"Rede restaurada", @"Conectada",@"Língua",
                          /*41-50*/@"Teste da Bateria",@"Gestão", @"Histórico", @"PRO", @"SNMP", @"Em carga", @"Insira endereço IP", @"Entre", @"Cancela",@"Palavra passe",
                          /*51-60*/@"Verificando",@"Palavra passe aceite", @"Palavra passe errada", @"Controle de saída 1", @"Controle de saída 2", @"Desligar PC", @"Reiniciar PC", @"Reiniciar UPS", @"Aviso!",@"Palavra passe necessária",
                          /*61-70*/@"Saída 1 a ligar!",@"Saída 1 a desligar!", @"Saída 2 a ligar!", @"Saída 2 a desligar!", @"PC irá desligar!", @"PC irá reiniciar!", @"UPS irá reiniciar!", @"Guardar IP", @"ON",@"OFF",nil];
    global.language_sv = [NSArray arrayWithObjects:
                          /*1-10*/ @"In spänning",@"Ut spänning", @"Batteri Kap", @"Last", @"In spänning", @"Ut spänning", @"Last i %", @"Batteri nivå", @"Batt. Reservtid",@"Batteri Status",
                          /*11-20*/@"Batteri fel",@"Batteri låg", @"Normal", @"Laddning", @"Urladdning", @"Batteri test", @"Test klar", @"UPS status", @"UPS fel",@"UPS Överlast",
                          /*21-30*/@"One Line",@"Bypass", @"Normal", @"AVR Bost", @"AVR Buck", @"Ström status", @"Utility status", @"Batteri Kapacitet", @"Batteri test",@"Test klar",
                          /*31-40*/@"UPS fungerar normalt",@"UPS går på Batteri", @"UPS frånkopplad", @"UPS tillkopplad", @"PRO frånkopplad", @"PRO tillkopplad", @"Ström bortfall", @"Ström åter", @"Anslut",@"Språk",
                          /*41-50*/@"Batteri test",@"Kontroll", @"Historie logg", @"PRO", @"SNMP", @"Laddar", @"Input IP port", @"Bekräfta", @"Avbeställ",@"Password",
                          /*51-60*/@"Verifiera",@"Password ok", @"Fel Password", @"Utgång 1", @"Utgång 2", @"PC avstängning", @"PC återstart", @"UPS avstängning", @"Varning",@"Password behövs",
                          /*61-70*/@"Utgång 1 är till",@"Utgång 1 är från", @"Utgång 2 är till", @"Utgång 2 är från", @"PC stänger av", @"PC återstartar", @"UPS återstartar", @"Spara IP", @"På",@"Av",nil];
    
    global.language_sp = [NSArray arrayWithObjects:
                          /*1-10*/ @"Voltaje de Entrada",@"Voltaje de Salida", @"Capacidad de Baterías", @"Carga", @"Voltaje de Entrada (V)", @"Voltaje de Salida (V)", @"Carga (%)", @"Nivel de Baterías (%)", @"Tiempo de respaldo en baterías (min)",@"Estado de baterías",
                          /*11-20*/@"Falla de baterías",@"Batería baja", @"Normal", @"Cargando", @"Descargando", @"Prueba de Baterías", @"Prueba Completa", @"Estado de UPS", @"Falla de UPS",@"UPS sobrecargado",
                          /*21-30*/@"En Línea",@"Bypass", @"Normal", @"AVR Boost", @"AVR Buck", @"Estado de potencia", @"Energía desde acometida", @"Energía desde batería", @"Prueba de Baterías",@"Prueba Completa",
                          /*31-40*/@"UPS trabaja normalmente", @"UPS trabaja desde baterías", @"UPS desconectado", @"UPS reconectado", @"PRO desconectado", @"PRO reconectado", @"Falla de energía", @"Energía restaurada",@"Conectado",@"Lenguaje",
                          /*41-50*/@"Prueba de Baterías",@"Control", @"Historial de eventos", @"PRO", @"SNMP", @"Cargando", @"Ingrese IP de destino", @"Ingresar", @"Cancelar",@"Contraseña",
                          /*51-60*/@"Verificando",@"Contraseña aceptada", @"Error de Contraseña", @"Control de salida 1", @"Control de salida 2", @"Apagado de PC", @"Reinicio de PC", @"Reinicio de UPS", @"Advertencia!",@"Requiere contraseña",
                          /*61-70*/@"Se encenderá salida 1!",@"Se apagará salida 1!", @"Se encenderá salida 2!", @"Se apagará salida 2!", @"Se apagará el PC!", @"Se reiniciará el PC!", @"Se reiniciará el UPS!", @"Grabar IP", @"Encendido",@"Apagado",nil];
    
    global.language_ar = [NSArray arrayWithObjects:
                          /*1-10*/ @"جهد الدخل",@"جهد الخرج", @"سعة البطارية", @"الحمل", @"جهدالدخل (V)", @"جهد الخرج (V)", @"الحمل (%)", @"مستوى البطارية", @"زمن التشغيل بالبطارية",@"حالة البطارية",
                          /*11-20*/@"عطل بالبطارية",@"بطارية منخفضة", @"حالة طبيعية", @"شحن", @"تفريغ", @"إختبار البطارية", @"تم الإختبار", @"حالة الجهاز", @"فشل الجهاز",@"تحميل زائد",
                          /*21-30*/@"على الخط",@"تمرير الجهد", @"حالة طبيعية", @"رفع الجهد", @"خفض الجهد", @"حالة الدخل", @"القدرة من تيار المدينة", @"القدرة من البطارية", @"إختبار البطارية",@"تم الإختبار",
                          /*31-40*/@"الجهاز يعمل بشكل طبيعى",@"الجهاز يعمل على البطارية", @"فصل الجهاز", @"إعادة توصيل الجهاز", @"فصل البرنامج", @"إعادة توصيل البرنامج", @"لا يوجد دخل", @"عودة الدخل", @"توصيل",@"اللغة",
                          /*41-50*/@"إختبار البطارية",@"التحكم", @"السجل التاريخى للأحداث", @"البرنامج", @"SNMP", @"تحميل", @"أدخل رقم تعريف الشبكة", @"إدخال", @"إلغاء",@"كلمة المرور",
                          /*51-60*/@"التحقق",@"كلمة مقبولة", @"خطأ فى كلمة المرور", @"التحكم فى خرج 1", @"التحكم فى خرج 2", @"إغلاق الحاسب", @"إعادة تشغيل الحاسب", @"إعادةتشغيل الجهاز", @"تحذير!",@"كلمة المرور لازمة",
                          /*61-70*/@"الخرج 1 سيعمل",@"الخرج 1 سيوقف", @"الخرج 2 سيعمل", @"الخرج 2 سيوقف", @"سيغلق الحاسب", @"سيعاد تشغيل الحاسب", @"سيعاد تشغيل الجهاز", @"حفظ رقم تعريف الشبكة", @"تشغيل",@"إيقاف",nil];
    
    global.language_ru = [NSArray arrayWithObjects:
                          /*1-10*/ @"Входное напряжение",@"Выходное напряжение", @"Ёмкость АКБ", @"Нагрузка", @"Входное напряжение (В)", @"Выходное напряжение (В)", @"Нагрузка (%)", @"Уровень заряда АКБ (%)", @"Время автономной работы (мин)",@"Состояние АКБ",
                          /*11-20*/@"АКБ неисправны",@"Низкий заряд АКБ", @"Нормальный режим", @"Зарядка", @"Разрядка", @"Тест АКБ", @"Тест завершён", @"Состояние ИБП", @"Ошибка ИБП",@"Перегрузка ИБП",
                          /*21-30*/@"Онлайн",@"Байпас", @"Норамльный режим", @"Повышение напряжения", @"Понижение напряжения", @"Состояние электропитания", @"Работа от сети", @"Работа от АКБ", @"Тест АКБ",@"Тест завершён",
                          /*31-40*/@"ИБП работает от сети",@"ИБП работает от АКБ", @"Ошибка соединения ИБП", @"Соединение восстановлено", @"Ошибка соединения ПО", @"Соединение восстановлено", @"Сбой электорпитания", @"Электропитание восстановлено", @"Подключить",@"Язык",
                          /*41-50*/@"Тест АКБ",@"Управление", @"История событий", @"PRO", @"SNMP", @"Загрузка", @"Введите IP-адрес ИБП", @"Ввод", @"Отмена",@"Пароль",
                          /*51-60*/@"Проверка пароля",@"Пароль подтверждён", @"Неверный пароль", @"Группа розеток 1", @"Группа розеток 2", @"Выключение ПК", @"Перезагрузка ПК", @"Перезагрузка ИБП", @"Внимание",@"Необходим ввод пароля",
                          /*61-70*/@"Группа розеток 1 ВКЛ",@"Группа розеток 2 ВЫКЛ", @"Группа розеток 2 ВКЛ", @"Группа розеток 2 ВЫКЛ", @"ПК будет выключен", @"ПК будет перезагружен", @"ИБП будет перезагружен", @"Сохранить IP-адрес", @"ВКЛ",@"ВЫКЛ",nil];
    

    //結束//
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//Server端 接收
-(BOOL) onUdpSocket:(AsyncUdpSocket *)sock didReceiveData:(NSData *)data withTag:(long)tag fromHost:(NSString *)host port:(UInt16)port
{
    NSString *string = global.IP;
    [userDefaults setObject:string forKey:@"store IP"];
    //要注意的是，設定好後只是單純的cache住，要存進硬碟要用，才真正儲存
    [userDefaults synchronize];
    
    //NSLog(@"in server");
    Byte *convert_to_byte = (Byte *)[data bytes];
    int receive[data.length];
    NSNumber *number;
    NSMutableArray *intArray = [[NSMutableArray alloc] init];
    
    
    //放入區域陣列
    for (int i = 0 ; i < [data length]; i++) {
        int combine = (int)convert_to_byte[i];
        receive[i] = combine;
        number =[NSNumber numberWithInt:combine];
        [intArray addObject:number];
        //NSLog(@"%d",receive[i]);//詳細接收
    }
    [global.globalData setArray:intArray];//copy到全域陣列以後
    [intArray removeAllObjects];//輕空區域陣列
    
    for(int i = 0; i < global.globalData.count; i++){
        //NSLog(@"i=%@",[global.globalData objectAtIndex:i]);
    }
    
    //NSLog(@"global-data count= %lu",(unsigned long)global.globalData.count);
    
    //receive要解析,先看長度決定pro or snmp
    //pro
    if (global.globalData.count == 30) {
        if ([global.globalData[0] integerValue]== 80 && [global.globalData[1] integerValue]== 67 && [global.globalData[2] integerValue]== 77 && [global.globalData[3] integerValue]== 82 && [global.globalData[4] integerValue]== 1) {//
            NSLog(@"pro NOW");
            global.PRO_now = true;
            global.SNMP_now = false;
            _disconnect_timer_counter = 0;
        }
    }
    if (global.globalData.count == 9) {
        if ([global.globalData[0] integerValue]== 80 && [global.globalData[1] integerValue]== 67 && [global.globalData[2] integerValue]== 77 && [global.globalData[3] integerValue]== 82 && [global.globalData[6] integerValue]== 69 && [global.globalData[7] integerValue]== 78 && [global.globalData[8] integerValue]== 68)
        {
            //Password 不對
            if ([global.globalData[5] integerValue] == 1)
                //back_passwd[1] = "success.";// 成功
                NSLog(@"Success");
            if ([global.globalData[5] integerValue] == 2)
                //back_passwd[1] = "password incorrect.";// 密碼錯誤
                NSLog(@"password incorrect");
            if ([global.globalData[5] integerValue] == 3)
                //back_passwd[1] = "inexecutable.";// 無法執行
                NSLog(@"inexcutable");
            if ([global.globalData[5] integerValue] == 4)
                //back_passwd[1] = "is execute now.";// 正在關機中
                NSLog(@"Is excute now");
        }
    }
    
    if (global.globalData.count > 9) {
        if ([global.globalData[0] integerValue]== 80 && [global.globalData[1] integerValue]== 67 && [global.globalData[2] integerValue]== 77 && [global.globalData[3] integerValue]== 82 && [global.globalData[4] integerValue]== 6
            && [global.globalData[global.globalData.count-3] integerValue]== 69 && [global.globalData[global.globalData.count-2] integerValue]== 78 && [global.globalData[global.globalData.count-1] integerValue]== 68)
        {
            //Password非固定長度
            NSData *short_data;;
            NSRange range = NSMakeRange (6,global.globalData.count -9);
            
            short_data = [data subdataWithRange:range];
            
            
            NSString* reply_password = [[NSString alloc] initWithData:data encoding:NSNonLossyASCIIStringEncoding];
            NSLog(@"all=%@",reply_password);
            
            NSString* reply_short = [[NSString alloc] initWithData:short_data encoding:NSNonLossyASCIIStringEncoding];
            NSLog(@"short=%@",reply_short);
            
            global.reply_password = reply_short;
        }
    }
    
    //snmp
    if (global.globalData.count > 100 &&[global.globalData[0] integerValue]== 48 ) {
        NSLog(@"snmp NOW");
        global.SNMP_now = true;
        global.PRO_now = false;
        _disconnect_timer_counter = 0;
    }
    
    [self analyze];
    
    Byte status[7] = {global.connect,global.ups_fail,global.badBat,global.oload,global.batlow,global.inv,global.test};
    [self alert_popup:status];
    
    
    [udpSocket sendData:data toHost:host port:port withTimeout:-1 tag:0];
    [udpSocket receiveWithTimeout:-1 tag:0];
    return YES;
}


-(void) sender{
    //Basic
    const unsigned char byte_pro[] = {80,67,77,71,1,69,78,68};
    const unsigned char byte_snmp[] = {48,-127,-30,2,1,0,4,6,112,117,98,108,105,99,-96,-127,-44,2,1,4,2,1,0,2,1,1,48,-127,-56,48,14,6,10,43,6,1,2,1,33,1,1,2,0,5,0,48,14,6,10,43,6,1,2,1,33,1,2,4,0,5,0,48,14,6,10,43,6,1,2,1,33,1,2,7,0,5,0,48,16,6,12,43,6,1,2,1,33,1,3,3,1,2,1,5,0,48,16,6,12,43,6,1,2,1,33,1,3,3,1,3,1,5,0,48,14,6,10,43,6,1,2,1,33,1,4,1,0,5,0,48,14,6,10,43,6,1,2,1,33,1,4,2,0,5,0,48,16,6,12,43,6,1,2,1,33,1,4,4,1,2,1,5,0,48,16,6,12,43,6,1,2,1,33,1,4,4,1,5,1,5,0,48,14,6,10,43,6,1,2,1,33,1,6,1,0,5,0,48,14,6,10,43,6,1,2,1,33,1,9,1,0,5,0,48,14,6,10,43,6,1,2,1,33,1,2,3,0,5,0};
    
    //Test
    const unsigned char send_self_pro_byte[] = { 80, 67, 77, 83, 1, 69, 78, 68 };
    const unsigned char send_self_snmp_byte[] = {48,53,2,1,0,4,6,112,117,98,108,105,99,-93,40,2,4,110,40,79,-98,2,1,0,2,1,0,48,26,48,24,6,10,43,6,1,2,1,33,1,7,1,0,6,10,43,6,1,2,1,33,1,7,7,3};
    const unsigned char send_deep_pro_byte[] = {};//PRO
    const unsigned char send_deep_snmp_byte[] = {48, 53, 2, 1, 0, 4, 6, 112, 117, 98, 108, 105, 99, -93, 40, 2, 4, 110, 40, 79, -98, 2, 1, 0, 2, 1, 0, 48, 26, 48, 24, 6, 10, 43, 6, 1, 2, 1, 33, 1, 7, 1, 0, 6, 10, 43, 6, 1, 2, 1, 33, 1, 7, 7, 5};
    const unsigned char send_cancel_pro_byte[] = {};//PRO
    const unsigned char send_cancel_snmp_byte[] = {48, 53, 2, 1, 0, 4, 6, 112, 117, 98, 108, 105, 99, -93, 40, 2, 4, 110, 40, 79, -98, 2, 1, 0, 2, 1, 0, 48, 26, 48, 24, 6, 10, 43, 6, 1, 2, 1, 33, 1, 7, 1, 0, 6, 10, 43, 6, 1, 2, 1, 33, 1, 7, 7, 2};
    
    //Outlet Control-snmp
    const unsigned char snmp_outlet1_on[]  = {48, 47, 2, 1, 0, 4, 6, 112, 117, 98, 108, 105, 99, -93, 34, 2, 4, 27, -75, -74, 47, 2, 1, 0, 2, 1, 0, 48, 20, 48, 18, 6, 13, 43, 6, 1, 4, 1, -54, 85, 1, 2, 13, 1, 2, 1, 2, 1, 1 };
    const unsigned char snmp_outlet1_off[] = {48, 47, 2, 1, 0, 4, 6, 112, 117, 98, 108, 105, 99, -93, 34, 2, 4, 27, -75, -74, 45, 2, 1, 0, 2, 1, 0, 48, 20, 48, 18, 6, 13, 43, 6, 1, 4, 1, -54, 85, 1, 2, 13, 1, 2, 1, 2, 1, 0};
    const unsigned char snmp_outlet2_on[]  = {48, 47, 2, 1, 0, 4, 6, 112, 117, 98, 108, 105, 99, -93, 34, 2, 4, 27, -75, -74, 51, 2, 1, 0, 2, 1, 0, 48, 20, 48, 18, 6, 13, 43, 6, 1, 4, 1, -54, 85, 1, 2, 13, 1, 2, 2, 2, 1, 1 };
    const unsigned char snmp_outlet2_off[] = {48, 47, 2, 1, 0, 4, 6, 112, 117, 98, 108, 105, 99, -93, 34, 2, 4, 27, -75, -74, 49, 2, 1, 0, 2, 1, 0, 48, 20, 48, 18, 6, 13, 43, 6, 1, 4, 1, -54, 85, 1, 2, 13, 1, 2, 2, 2, 1, 0 };
    
    //password
    const unsigned char check_password[] = {80,67,77,71,6,69,78,68};
    
    NSData *data_pro = [NSData dataWithBytes:byte_pro length:sizeof(byte_pro)];
    NSData *data_snmp= [NSData dataWithBytes:byte_snmp length:sizeof(byte_snmp)];
    NSData *data_self_pro = [NSData dataWithBytes:send_self_pro_byte length:sizeof(send_self_pro_byte)];
    NSData *data_self_snmp = [NSData dataWithBytes:send_self_snmp_byte length:sizeof(send_self_snmp_byte)];
    NSData *data_deep_snmp = [NSData dataWithBytes:send_deep_snmp_byte length:sizeof(send_deep_snmp_byte)];
    NSData *data_cancel_snmp = [NSData dataWithBytes:send_cancel_snmp_byte length:sizeof(send_cancel_snmp_byte)];
    NSData *data_snmp_outlet1_on = [NSData dataWithBytes:snmp_outlet1_on length:sizeof(data_snmp_outlet1_on)];
    NSData *data_snmp_outlet1_off = [NSData dataWithBytes:snmp_outlet1_off length:sizeof(snmp_outlet1_off)];
    NSData *data_snmp_outlet2_on = [NSData dataWithBytes:snmp_outlet2_on length:sizeof(snmp_outlet2_on)];
    NSData *data_snmp_outlet2_off = [NSData dataWithBytes:snmp_outlet2_off length:sizeof(snmp_outlet2_off)];
    NSData *data_check_password = [NSData dataWithBytes:check_password length:sizeof(check_password)];
    
    
    
    if (global.IP != nil) {
        
        if (global.PRO_Quick_test) {
            //QUICK test
            [udpSocket sendData:data_self_pro toHost:global.IP port:2601 withTimeout:-1 tag:tag];
            global.PRO_Quick_test = false;
            NSLog(@"Quick Test (PRO)");
        }
        else if (global.PRO_Deep_test){
            //DEEP test
        }else if(global.PRO_Cancel_test){
            //Cancel test
        }else{
            //PRO
            if(global.ENABLE_Password)
            {
                [udpSocket sendData:data_check_password toHost:global.IP port:2601 withTimeout:-1 tag:tag];
                global.ENABLE_Password = false;
            }
            
            if (global.ENABLE_send) {
                
                if (global.OUT1_ENABLE) {
                    if (global.Password_correct) {
                        NSData *data = [self OutletControl:global.reply_password and:0];
                        if (data != nil)
                            [udpSocket sendData:data toHost:global.IP port:2601 withTimeout:-1 tag:tag];
                        
                        global.ENABLE_send = false;
                        global.OUT1_ENABLE = false;
                    }
                }
                
                if (global.OUT1_DISABLE) {
                    if (global.Password_correct) {
                        NSData *data = [self OutletControl:global.reply_password and:1];
                        if (data != nil)
                            [udpSocket sendData:data toHost:global.IP port:2601 withTimeout:-1 tag:tag];
                        
                        global.ENABLE_send = false;
                        global.OUT1_DISABLE = false;
                    }
                }
                
                
                if (global.OUT2_ENABLE) {
                    if (global.Password_correct) {
                        NSData *data = [self OutletControl:global.reply_password and:2];
                        if (data != nil)
                            [udpSocket sendData:data toHost:global.IP port:2601 withTimeout:-1 tag:tag];
                        
                        global.ENABLE_send = false;
                        global.OUT2_ENABLE = false;
                    }
                }
                
                if (global.OUT2_DISABLE) {
                    if (global.Password_correct) {
                        NSData *data = [self OutletControl:global.reply_password and:3];
                        if (data != nil)
                            [udpSocket sendData:data toHost:global.IP port:2601 withTimeout:-1 tag:tag];
                        
                        global.ENABLE_send = false;
                        global.OUT2_DISABLE = false;
                    }
                }
                
                
                if (global.PC_reboot) {
                    if (global.Password_correct) {
                        NSData *data = [self OutletControl:global.reply_password and:4];
                        if (data != nil)
                            [udpSocket sendData:data toHost:global.IP port:2601 withTimeout:-1 tag:tag];
                        
                        global.ENABLE_send = false;
                        global.PC_reboot = false;
                    }
                }
                
                if(global.PC_shutdown){
                    if (global.Password_correct) {
                        NSData *data = [self OutletControl:global.reply_password and:5];
                        if (data != nil)
                            [udpSocket sendData:data toHost:global.IP port:2601 withTimeout:-1 tag:tag];
                        global.ENABLE_send = false;
                        global.PC_shutdown = false;
                    }
                }
                
                if(global.UPS_reboot){
                    if (global.Password_correct) {
                        NSData *data = [self OutletControl:global.reply_password and:6];
                        if (data != nil)
                            [udpSocket sendData:data toHost:global.IP port:2601 withTimeout:-1 tag:tag];
                        global.ENABLE_send = false;
                        global.UPS_reboot = false;
                    }
                }
            }
            
            if (global.PRO_now) {
                [udpSocket sendData:data_pro toHost:global.IP port:2601 withTimeout:-1 tag:tag];
                NSLog(@"Send PRO");
            }
        }
        
        //SNMP
        if(global.SNMP_Quick_test){
            [udpSocket sendData:data_self_snmp toHost:global.IP port:161 withTimeout:-1 tag:tag];
            global.SNMP_Quick_test = false;
        }
        else if(global.SNMP_Deep_test){
            [udpSocket sendData:data_deep_snmp toHost:global.IP port:161 withTimeout:-1 tag:tag];
            global.SNMP_Deep_test = false;
        }
        else if(global.SNMP_Cancel_test){
            [udpSocket sendData:data_cancel_snmp toHost:global.IP port:161 withTimeout:-1 tag:tag];
            global.SNMP_Cancel_test = false;
        }
        else{
            if (global.ENABLE_send) {
                if (global.SNMP_OUT1_ENABLE) {
                    if (global.SNMP_outlet1_on_off)
                    {
                        [udpSocket sendData:data_snmp_outlet1_on toHost:global.IP port:161 withTimeout:-1 tag:tag];
                        global.ENABLE_send = false;
                    }
                    else
                    {
                        [udpSocket sendData:data_snmp_outlet1_off toHost:global.IP port:161 withTimeout:-1 tag:tag];
                        global.ENABLE_send = false;
                    }
                    global.SNMP_OUT1_ENABLE = false;
                    
                } else if (global.SNMP_OUT2_ENABLE) {
                    
                    if (global.SNMP_outlet2_on_off) {
                        [udpSocket sendData:data_snmp_outlet2_on toHost:global.IP port:161 withTimeout:-1 tag:tag];
                        global.ENABLE_send = false;
                    } else {
                        [udpSocket sendData:data_snmp_outlet2_off toHost:global.IP port:161 withTimeout:-1 tag:tag];
                        global.ENABLE_send = false;
                    }
                    global.SNMP_OUT2_ENABLE = false;
                }
            }
            else if (global.SNMP_now) {
                [udpSocket sendData:data_snmp toHost:global.IP port:161 withTimeout:-1 tag:tag];
                NSLog(@"Send SNMP");
            }
        }
    }
}

-(NSData* ) OutletControl:(NSString*)Password  and: (int)Serial
{
    const unsigned char out1_on[]    = {80 ,67 ,77 ,83,2,2};
    const unsigned char out1_off[]   = {80 ,67 ,77 ,83,2,1};
    const unsigned char out2_on[]    = {80 ,67 ,77 ,83,2,4};
    const unsigned char out2_off[]   = {80 ,67 ,77 ,83,2,3};
    const unsigned char pc_reboot[]  = {80 ,67 ,77 ,83,3,30};
    const unsigned char pc_shutdown[]= {80 ,67 ,77 ,83,4,30};
    const unsigned char ups_reboot[] = {80 ,67 ,77 ,83,5,30};
    const unsigned char end[]        = {69 ,78 ,68};
    
    NSMutableData * pro_out1_on = [[NSMutableData alloc] init];
    NSMutableData * pro_out1_off = [[NSMutableData alloc] init];
    NSMutableData * pro_out2_on = [[NSMutableData alloc] init];
    NSMutableData * pro_out2_off = [[NSMutableData alloc] init];
    NSMutableData * pro_pc_reboot = [[NSMutableData alloc] init];
    NSMutableData * pro_pc_shutdown = [[NSMutableData alloc] init];
    NSMutableData * pro_ups_reboot = [[NSMutableData alloc] init];
    
    char *password_char = [Password UTF8String];
    NSMutableData * data_password = [NSData dataWithBytes:password_char length:[Password length]];//這邊要用length
    NSMutableData * data_end = [NSData dataWithBytes:end length:sizeof(end)];//這邊要用length
    
    NSMutableData * data_out1_on = [NSData dataWithBytes:out1_on length:sizeof(out1_on)];
    NSMutableData * data_out1_off = [NSData dataWithBytes:out1_off length:sizeof(out1_off)];
    NSMutableData * data_out2_on = [NSData dataWithBytes:out2_on length:sizeof(out2_on)];
    NSMutableData * data_out2_off = [NSData dataWithBytes:out2_off length:sizeof(out2_off)];
    NSMutableData * data_pc_reboot = [NSData dataWithBytes:pc_reboot length:sizeof(pc_reboot)];
    NSMutableData * data_pc_shutdown = [NSData dataWithBytes:pc_shutdown length:sizeof(pc_shutdown)];
    NSMutableData * data_ups_reboot = [NSData dataWithBytes:ups_reboot length:sizeof(ups_reboot)];
    
    [pro_out1_on appendData:data_out1_on];
    [pro_out1_on appendData:data_password];
    [pro_out1_on appendData:data_end];
    
    [pro_out1_off appendData:data_out1_off];
    [pro_out1_off appendData:data_password];
    [pro_out1_off appendData:data_end];
    
    [pro_out2_on appendData:data_out2_on];
    [pro_out2_on appendData:data_password];
    [pro_out2_on appendData:data_end];
    
    [pro_out2_off appendData:data_out2_off];
    [pro_out2_off appendData:data_password];
    [pro_out2_off appendData:data_end];
    
    [pro_pc_reboot appendData:data_pc_reboot];
    //[pro_pc_reboot appendData:data_password];
    [pro_pc_reboot appendData:data_end];
    
    [pro_pc_shutdown appendData:data_pc_shutdown];
    //[pro_pc_shutdown appendData:data_password];
    [pro_pc_shutdown appendData:data_end];
    
    
    [pro_ups_reboot appendData:data_pc_reboot];
    [pro_ups_reboot appendData:data_password];
    [pro_ups_reboot appendData:data_end];
    
    switch(Serial){
        case 0://Outlet1 on
            return pro_out1_on;
        case 1://Outlet1 off
            return pro_out1_off;
        case 2://Outlet2 on
            return pro_out2_on;
        case 3://Outlet2 off
            return pro_out2_off;
        case 4://PC shutdown
            return pro_pc_shutdown;
        case 5://PC Reboot
            return pro_pc_reboot;
        case 6://UPS Reboot
            return pro_ups_reboot;
    }
    
    NSData *return_data_nil;
    return return_data_nil;
}

-(void) analyze{
    //pro
    
    @try {
        
        if (global.PRO_now) {
            global.ivolt = ([global.globalData[5] integerValue]*256)+ [global.globalData[6] integerValue];
            
            global.ovolt = ([global.globalData[7] integerValue]*256)+ [global.globalData[8] integerValue];
            
            global.batbackupTime = (([global.globalData[9] integerValue]*256)+ [global.globalData[10] integerValue])/60;
            
            global.load = [global.globalData[11] integerValue];
            
            global.batLevel = [global.globalData[12] integerValue];
            
            global.ifreq = (int)[global.globalData[13] integerValue];
            
            global.ofreq = [global.globalData[14] integerValue];
            
            global.temp = [global.globalData[15] integerValue];
            
            global.ONLine = [global.globalData[16] integerValue];
            
            global.BypassAVR = [global.globalData[17] integerValue];
            
            global.inv = [global.globalData[18] integerValue];
            
            global.batlow = [global.globalData[19] integerValue];
            
            global.oload = [global.globalData[20] integerValue];
            
            global.ups_fail = [global.globalData[21] integerValue];
            
            global.badBat = [global.globalData[22] integerValue];
            
            global.test = [global.globalData[23] integerValue];
            
            global.connect = [global.globalData[24] integerValue];
        }
        else if (global.SNMP_now)
        {
            
            int global_data_length = global.globalData.count;
            NSInteger snmp_data[global.globalData.count-17];
            int BatLevel = 0,Temp = 0,IFreq = 0,IVolt = 0 ,OFreq = 0,OVolt = 0,Load = 0,BatTime = 0,Test = 0,BatLow = 0,Inv = 0,ONLine = 0,BypassAVR = 0;
            int OutputSource = 0,Alarm,UPSFail = 0,BadBat = 0,Overload = 0,Connect = 0;
            
            for(int tmp = 17;tmp<global_data_length;tmp++)
            {
                snmp_data[tmp-17] = [global.globalData[tmp] integerValue];
                //NSLog(@"snmp data [ %d ]",[global.globalData[tmp-17] integerValue]);
            }
            //餵資料給snmp_data
            
            for(int i = 0;i<global_data_length-20;i++)
            {
                if(snmp_data[i]==6 && snmp_data[i+1]==1 && snmp_data[i+2]==2 && snmp_data[i+3]==1 && snmp_data[i+4]==33 && snmp_data[i+5]==1)
                {
                    //----BatteryLevel
                    if(snmp_data[i+6]==2 && snmp_data[i+7]==4 && snmp_data[i+8]==0 && snmp_data[i+9]==2){
                        global.batLevel = snmp_data[i+11];
                        //Log.i("batlevel",Integer.toString(BatLevel));
                    }
                    //----Temperature
                    if(snmp_data[i+6]==2 && snmp_data[i+7]==7 && snmp_data[i+8]==0 && snmp_data[i+9]==2){
                        global.temp = snmp_data[i+11];
                    }
                    //----in Freq
                    if(snmp_data[i+6]==3 && snmp_data[i+7]==3 && snmp_data[i+8]==1 && snmp_data[i+9]==2 && snmp_data[i+10]==1 && snmp_data[i+11]==2){
                        if(snmp_data[i+12]==1){
                            global.ifreq = snmp_data[i+13];
                        }
                        if(snmp_data[i+12]>1){
                            global.ifreq = snmp_data[i+13]*256+snmp_data[i+14];
                        }
                    }
                    //-----in Voltage
                    if(snmp_data[i+6]==3 && snmp_data[i+7]==3 && snmp_data[i+8]==1 && snmp_data[i+9]==3 && snmp_data[i+10]==1 && snmp_data[i+11]==2){
                        if(snmp_data[i+12]==1){
                            global.ivolt = snmp_data[i+13];
                        }
                        if(snmp_data[i+12]>1){
                            global.ivolt = snmp_data[i+13]*256+snmp_data[i+14];
                        }
                        if(IVolt>600){
                            global.ivolt = IVolt/10;
                        }
                    }
                    //----Outputsource
                    if(snmp_data[i+6]==4 && snmp_data[i+7]==1 && snmp_data[i+8]==0 && snmp_data[i+9]==2){
                        OutputSource = snmp_data[i+11];
                    }
                    //----OutFreq
                    if(snmp_data[i+6]==4 && snmp_data[i+7]==2 && snmp_data[i+8]==0 && snmp_data[i+9]==2){
                        if(snmp_data[i+10]==1){
                            OFreq = snmp_data[i+11];
                        }
                        if(snmp_data[i+10]>1){
                            OFreq = snmp_data[i+11]*256+snmp_data[i+12];
                        }
                    }
                    //---OutVoltage
                    if(snmp_data[i+6]==4 && snmp_data[i+7]==4 && snmp_data[i+8]==1 && snmp_data[i+9]==2 && snmp_data[i+10]==1 && snmp_data[i+11]==2){
                        
                        if(snmp_data[i+12]==1){
                            global.ovolt = snmp_data[i+13];
                        }
                        if(snmp_data[i+12]>1){
                            global.ovolt = snmp_data[i+13]*256 + snmp_data[i+14];
                        }
                        
                        if(OVolt>600){
                            global.ovolt = OVolt/10;
                        }
                    }
                    //----Load
                    if(snmp_data[i+6]==4 && snmp_data[i+7]==4 && snmp_data[i+8]==1 && snmp_data[i+9]==5 && snmp_data[i+10]==1 && snmp_data[i+11]==2){
                        global.load = snmp_data[i+13];
                        if(global.load > 110){
                            Overload = 1;
                        }else{
                            Overload = 0;
                        }
                    }
                    //----Backup Time
                    if(snmp_data[i+6]==2 && snmp_data[i+7]==3 && snmp_data[i+8]==0 && snmp_data[i+9]==2){
                        
                        if(snmp_data[i+10] == 1){
                            global.batbackupTime = snmp_data[i+11];
                        }
                        else if(snmp_data[i+10] == 2){
                            global.batbackupTime = snmp_data[i+11]*256+snmp_data[i+12];
                        }
                    }
                    // ----Alarm
                    if (snmp_data[i + 6] == 6 && snmp_data[i + 7] == 1&& snmp_data[i + 8] == 0) {
                        
                        Alarm = snmp_data[i + 11];
                        if (Alarm == 1) {
                            global.test = 1;
                        } else {
                            global.test = 0;
                        }
                        
                        if (Alarm == 3) {
                            global.batlow = 1;
                        } else {
                            global.batlow = 0;
                        }
                    }
                    
                    if(OutputSource == 5){
                        global.inv =1;
                    }
                    else{
                        global.inv =0;
                    }
                    global.ONLine = 0;
                    global.BypassAVR = 0;
                    if(OutputSource == 4){
                        global.BypassAVR = 1;
                    }
                    if(OutputSource == 6){
                        global.BypassAVR = 2;
                        global.ONLine =1;
                    }
                    if(OutputSource == 7){
                        global.BypassAVR = 3;
                        global.ONLine = 1;
                    }
                    
                }
            }
            
        }
        
        //        NSLog(@"ivolt= %d",ivolt);
        //        NSLog(@"ovolt= %d",ovolt);
        //        NSLog(@"batTime= %d",batTime);
        //        NSLog(@"load= %d",load);
        //        NSLog(@"batLevel= %d",batTime);
        //        NSLog(@"ifreq= %d",ifreq);
        //        NSLog(@"ofreq= %d",ofreq);
        //        NSLog(@"temp= %d",temp);
        //        NSLog(@"on_line= %d",on_line);
        //        NSLog(@"BypassAVR= %d",BypassAVR);
        //        NSLog(@"inv= %d",inv);
        //        NSLog(@"batlow= %d",batlow);
        //        NSLog(@"oload= %d",oload);
        //        NSLog(@"ups_fail= %d",ups_fail);
        //        NSLog(@"badBat= %d",badBat);
        //        NSLog(@"test= %d",test);
        //        NSLog(@"connect= %d",connect);
        
        //snmp
        
    }
    @catch (NSException *exception) {
        //<#Handle an exception thrown in the @try block#>
    }
    @finally {
        //<#Code that gets executed whether or not an exception is thrown#>
    }
}

-(void) alert_popup:(Byte* ) status{
    //UPS狀態/Battery狀態/電力狀態
    NSLog(@"%d",global.test);
    NSLog(@"%d",status[6]);
    if (status[0] == 0) // connect = normal
    {
        if (Connect_pre == 1)// 原本斷線
        {
            Notify_Flag = true;
            [self notify_Warning:@"Reconnect"];
            //[self notify_Warning:@"Reconnect");//"Reconnect"
            Notify_Flag = false;
            Event_TF[0] = false;//設定為正常
        }
        
        if(Event_TF[0] == false){//正常
            if(Event_01[0] == 1)
            {
                //Write_internal_File(1);//傳入事件(1)-Connect Restore
                Event_01[0] = 0;//關閉開關,不能再次寫入
            }
        }
        Connect_pre = 0;
        
        if (status[1] == 1) { // UPSFail(UPS錯誤)
            
            if (UPSFail_pre == 0) // 如果原本為正常
            {
                Notify_Flag = true;
                [self notify_Warning:@"UPS Failed"];//"UPS Failed"
                Event_TF[2] = true;//設定為不正常
            } else {
                // 原本不正常
                Notify_Flag = false; // 不用再次通知
            }
            
            if(Event_TF[2] == true){//事件發生
                if(Event_01[1] == 0)
                {
                    //Write_internal_File(2);
                    Event_01[1] = 1;//關閉開關,不能再次寫入
                }
            }
            UPSFail_pre = 1;
        } else { // UPSFail 正常
            if (UPSFail_pre == 1)// 如果原本不正常,恢復了
            {
                Notify_Flag = true;
                [self notify_Warning:@"UPS Normal"];//"UPS Normal"
                Notify_Flag = false;
                Event_TF[3] = false;//設定為正常
            }
            
            if(Event_TF[3] == false){
                if(Event_01[1] == 1)
                {
                    //Write_internal_File(3);//傳入事件(2)-UPS Fail Restore
                    Event_01[1] = 0;//關閉開關,不能再次寫入
                }
            }
            UPSFail_pre = 0;// 如果不正常->正常or正常->正常,目 前狀態都為 正常,因此set為0
        }
        if (status[2] == 1) { // BatBad
            
            if (BadBattery_pre == 0) // 如果原本為正常
            {
                Notify_Flag = true;
                [self notify_Warning:@"Battery Failed"];//"Battery Failed"
                Event_TF[4] = true;
            } else {
                // 原本不正常
                Notify_Flag = false;// 不用再次通知
                
            }
            
            if(Event_TF[4] == true){//事件發生
                if(Event_01[2] == 0)
                {
                    //Write_internal_File(4);//Battery bad
                    Event_01[2] = 1;//關閉開關,不能再次寫入
                }
            }
            BadBattery_pre = 1;
        } else { // battery bad 正常
            if (BadBattery_pre == 1)// 如果原本不正常,恢復了
            {
                Notify_Flag = true;
                [self notify_Warning:@"Battery Normal"];//"Battery Normal"
                Notify_Flag = false;
                Event_TF[5] = false;//設定為正常
            }
            
            if(Event_TF[5] == false){
                if(Event_01[2] == 1)
                {
                    //Write_internal_File(5);//傳入事件(5)- Battery bad Restore
                    Event_01[2] = 0;//關閉開關,不能再次寫入
                }
            }
            // 如果不正常->正常or正常->正常,目前狀態都為 正常, 因此set為0
            BadBattery_pre = 0;
        }
        if (status[3] == 1) { // OLoad(OverLoad)
            if (OLoad_pre == 0) // 如果原本為正常
            {
                Notify_Flag = true;
                [self notify_Warning:@"UPS Overload"];//"UPS Overload"
                Event_TF[6] = true;//設定為不正常
            } else {
                // 原本不正常
                Notify_Flag = false;// 不用再次通知
            }
            
            if(Event_TF[6] == true){//事件發生
                if(Event_01[3] == 0)
                {
                    //Write_internal_File(6);//OverLoad
                    Event_01[3] = 1;//關閉開關,不能再次寫入
                }
            }
            OLoad_pre = 1;
            
        } else { // Overload正常
            if (OLoad_pre == 1)// 如果原本不正常,恢復了
            {
                Notify_Flag = true;
                [self notify_Warning:@"UPS Normal"];//"UPS Normal"
                Notify_Flag = false;
                Event_TF[7] = false;//設定為正常
            }
            
            if(Event_TF[7] == false){
                if(Event_01[3] == 1)
                {
                    //Write_internal_File(7);//傳入事件()- Overload Restore
                    Event_01[3] = 0;//關閉開關,不能再次寫入
                }
            }
            // 如果不正常->正常or正常->正常,目前狀態都為 正常, 因此set為0
            OLoad_pre = 0;
        }
        
        if (status[4] == 1) { // Battery Low(低電壓)
            
            if (BatLow_pre == 0) // 如果原本為正常
            {
                Notify_Flag = true;
                [self notify_Warning:@"UPS Low Battery"];//"UPS Low Battery"
                Event_TF[8] = true;//設定為不正常
            } else {
                // 原本不正常
                Notify_Flag = false;// 不用再次通知
            }
            
            if(Event_TF[8] == true){//事件發生
                if(Event_01[4] == 0)
                {
                    //Write_internal_File(8);//Battery Low
                    Event_01[4] = 1;//關閉開關,不能再次寫入
                }
            }
            BatLow_pre = 1;
        } else { // 低電壓 正常
            if (BatLow_pre == 1)// 如果原本不正常,恢復了
            {
                Notify_Flag = true;
                [self notify_Warning:@"Battery Normal"];//"Battery Normal"
                Notify_Flag = false;
                Event_TF[9] = false;//設定為正常
            }
            
            if(Event_TF[9] == false){
                if(Event_01[4] == 1)
                {
                    //Write_internal_File(9);//傳入事件(9)-BatteryLow Restore
                    Event_01[4] = 0;//關閉開關,不能再次寫入
                }
            }
            // 如果不正常->正常or正常->正常,目前狀態都為 正常, 因此set為0
            BatLow_pre = 0;
        }
        
        if (status[5] == 1) { // Inv(斷電)
            
            if (Inv_pre == 0) // 如果原本為正常
            {
                Notify_Flag = true;
                [self notify_Warning:@"Power Failure"];//"Power Failure"
                Event_TF[10] = true;//設定為不正常
            } else {
                // 原本不正常
                Notify_Flag = false;// 不用再次通知
            }
            
            if(Event_TF[10] == true){//事件發生
                if(Event_01[5] == 0)
                {
                    //Write_internal_File(10);//Power Failure
                    Event_01[5] = 1;//關閉開關,不能再次寫入
                }
            }
            Inv_pre = 1;
        } else { // Inv 正常
            if (Inv_pre == 1)// 如果原本不正常,恢復了
            {
                Notify_Flag = true;
                [self notify_Warning:@"Power Restore"];//"Power Restore"
                Notify_Flag = false;
                Event_TF[11] = false;//設定為正常
            }
            
            if(Event_TF[11] == false){
                if(Event_01[5] == 1)
                {
                    //Write_internal_File(11);//傳入事件(11)- Power Restore
                    Event_01[5] = 0;//關閉開關,不能再次寫入
                }
            }
            // 如果不正常->正常or正常->正常,目前狀態都為 正常, 因此set為0
            Inv_pre = 0;
        }
        
        if (status[6] == 1) // Test
        {
            if (Test_pre == 0) // 如果原本為正常
            {
                Notify_Flag = true;
                [self notify_Warning:@"UPS Testing"];//"UPS Testing"
                Event_TF[12] = true;//設定為不正常
            } else {
                // 原本不正常
                Notify_Flag = false;// 不用再次通知
            }
            
            if(Event_TF[12] == true){//事件發生
                if(Event_01[6] == 0)
                {
                    //Write_internal_File(12);//UPS Battery Test
                    Event_01[6] = 1;//關閉開關,不能再次寫入
                }
            }
            Test_pre = 1;
        } else { // 正常
            if (Test_pre == 1)// 如果原本不正常,恢復了
            {
                //這邊要修改,check Bad Battery是否為0(Battery Normal) or 1(Battery Failed)
                Notify_Flag = true;
                if(status[2] == 0){
                    [self notify_Warning:@"Battery Normal"];//"Battery Normal"
                    //Write_internal_File(5);//Battery Normal
                }
                else{
                    [self notify_Warning:@"Battery Failed"];//"Battery Failed"
                    //Write_internal_File(4);//"Battery Failed"
                }
                Notify_Flag = false;
                Event_TF[12] = false;//設定為正常
            }
            
            if(Event_TF[12] == false){
                if(Event_01[6] == 1)
                {
                    //這邊不用做動作
                    Event_01[6] = 0;//關閉開關,不能再次寫入
                }
            }
            // 如果不正常->正常or正常->正常,目前狀態都為 正常, 因此set為0
            Test_pre = 0;
        }
        
        if (status[7] != 0) // BypassAVR Bypass_pre
        {
            // 如果Normal就秀ON-LINE or OFF-LINE
            switch (status[7]) {// 1 or 2 or 3
                case 1:
                    
                    if (Bypass_pre == 0) // 如果原本為正常
                    {
                        Notify_Flag = true;
                        [self notify_Warning:@"Bypass"];//"Bypass"
                        Event_TF[13] = true;
                    } else {
                        // 原本不正常
                        Notify_Flag = false;// 不用再次通知
                    }
                    Bypass_pre = 1;
                    break;
                case 2:
                    
                    if (Bypass_pre == 0) // 如果原本為正常
                    {
                        Notify_Flag = true;
                        [self notify_Warning:@"AVR Boost"];//"AVR Boost"
                    } else {
                        // 原本不正常
                        Notify_Flag = false;// 不用再次通知
                    }
                    Bypass_pre = 2;
                    break;
                case 3:
                    if (Bypass_pre == 0) // 如果原本為正常
                    {
                        Notify_Flag = true;
                        [self notify_Warning:@"AVR Buck"];//"AVR Buck"
                        
                    } else {
                        // 原本不正常
                        Notify_Flag = false;// 不用再次通知
                    }
                    Bypass_pre = 3;
                    break;
            }
            
            if(Event_TF[13] == true){//事件發生
                if(Event_01[7] == 0)
                {
                    //Write_internal_File(13);//BypassAVR
                    Event_01[7] = 1;//關閉開關,不能再次寫入
                }
            }
        } else { // Bypass AVR 正常
            if (Bypass_pre == 1)// 如果原本不正常,恢復了
            {
                Notify_Flag = true;
                [self notify_Warning:@"AVR Normal"];//"AVR Normal"
                Notify_Flag = false;
                Event_TF[14] = false;//設定為正常
            }
            
            if(Event_TF[14] == false){
                if(Event_01[7] == 1)
                {
                    //Write_internal_File(14);//傳入事件(13)-BypassAVR Restore
                    Event_01[7] = 0;//關閉開關,不能再次寫入
                }
            }
            Bypass_pre = 0;
        }
    }
    else // disconnect
    {
        if (Connect_pre == 0) // 如果原本為正常
        {
            Notify_Flag = true;
            [self notify_Warning:@"UPS Disconnect"];//"UPS Disconnect"
            Event_TF[0] = true;//設定為不正常
        } else {
            // 原本不正常
            Notify_Flag = false;// 不用再次通知
        }
        
        if(Event_TF[0] == true){//事件發生
            if(Event_01[0] == 0)
            {
                //Write_internal_File(0);//Disconnect
                Event_01[0] = 1;//關閉開關,不能再次寫入
            }
        }
        Connect_pre = 1;
    }
    
}

-(void) notify_Warning:(NSString *)message{
    NSLog(@"%@",message);
    
    [MPNotificationView notifyWithText:@"Warning!"
                                detail:message
                                 image:nil//[UIImage imageNamed:@"mopedDog.jpeg"]
                           andDuration:5.0];
    //讓app icon上增加紅色的圓圈數字
    
    UILocalNotification *note = [UILocalNotification new];
    note.alertBody = message;
    //note.applicationIconBadgeNumber -= 1;//減少1
    //note.applicationIconBadgeNumber = 1;//設定1
    note.soundName = UILocalNotificationDefaultSoundName;
    note.fireDate = [NSDate dateWithTimeIntervalSinceNow:0.1];
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
    
}

-(void) disconnect_dectect{
    
    _disconnect_timer_counter++;
    NSLog(@"second = %hhu",_disconnect_timer_counter);
    
    if (_disconnect_timer_counter == 55) {
        //重新連線
        global.PRO_now = true;
        global.SNMP_now = true;
    }
    
    if (_disconnect_timer_counter == 60) {
        //歸0
        _disconnect_timer_counter = 0;
        
        if (disconnect_flag == true) {
            //popup disconnect message
            
            if (global.IP != nil) {
                //這邊文字要調整,各國語言
                NSString *disconnect_multi_language;
                if(global.PRO_now)
                {
                    disconnect_multi_language = global.language_now[35];
                }
                if (global.SNMP_now) {
                    disconnect_multi_language = global.language_now[33];
                }
                AMSmoothAlertView *alert = [[AMSmoothAlertView alloc]initFadeAlertWithTitle:@"Sorry!" andText:disconnect_multi_language andCancelButton:NO forAlertType:AlertFailure];
                [alert.defaultButton setTitle:@"Too Bad :(" forState:UIControlStateNormal];
                [alert show];
            }
        }
    }
    
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
    }
    
    if (buttonIndex == 1) {
        UITextField *input_ip=  [init_pop_ip textFieldAtIndex: 0];
        NSLog(@"%@",input_ip.text);
        global.IP = input_ip.text;
        
        NSString *string = global.IP;
        [userDefaults setObject:string forKey:@"store IP"];
        //要注意的是，設定好後只是單純的cache住，要存進硬碟要用，才真正儲存
        [userDefaults synchronize];
        
        NSString *store_ip = [userDefaults stringForKey:@"store IP"];
        NSLog(@"%@",store_ip);
    }
    
}



@end
