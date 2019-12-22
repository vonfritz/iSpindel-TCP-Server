UPDATE Settings SET DeviceName=('_DEFAULT');
UPDATE Settings SET DeviceName=('GLOBAL') WHERE Parameter IN('ENABLE_ADDCOLS', 'DATETIME', 'DELIMITER', 'NEWLINE', 'ENABLESTATUS', 'FROMADDR', 'PASSWD', 'SMTPPORT', 'SMTPSERVER', 'TIMESTATUS', 'TOADDR', 'HOST', 'LANGUAGE', 'PORT');

INSERT IGNORE INTO `Settings` (`Section`, `Parameter`, `value`, `Description_DE`, `Description_EN`, `Description_IT`, `DeviceName`) VALUES
('EMAIL', 'ENABLEMAIL', '1', 'Aktiviere Email Funktion für Device (0:nein 1: ja)', 'Activate email function for device (1: yes 0: no)', 'Attiva la funzione Email per dispositivo (1: si 0: no)', '_DEFAULT'),
('EMAIL', 'EXCLUDESTRING', 'XXX', 'Device Name mit Teilstring wird von Email Alarmen ausgeschlossen', 'Devicename with substring is excluded from Email alarms', 'Il nome dispositivo con sottostringa è escluso dagli allarmi e-mail', 'GLOBAL'),
('GENERAL', 'SHOWSUMMARY', '1', 'Anzeige von Device in der Übersicht auf der Hauptseite. (0: nein 1: ja)', 'Show device in summary on main page (0: no 1: yes)', 'Visualizzazione del dispositivo nella panoramica sulla pagina principale. (0: no 1: sì)', '_DEFAULT');

REPLACE INTO `Strings` (`File`, `Field`, `Description_DE`, `Description_EN`, `Description_IT`) VALUES
('index', 'adjust_history', 'Historie anpassen', 'Adjust history', 'Aggiorna storia'),
('index', 'header_initialgravity', 'Stammwürze [°P]', 'Initial gravity [°P]', 'Densità iniziale OG [°P]'),
('index', 'no_data', 'Keine Daten in den letzten %1$d Tagen gespeichert. Bitte Spindel Verbinden, damit Daten angezeigt werden können.', 'No spindle data received in the past %1$d days. Please connect Spindle to generate data.', 'Nessun dato salvato negli ultimi %1$d giorni. Collegare l\'ispindle che i dati possano essere visualizzati.'),
('index', 'server_running', 'TCP Server läuft mit PID: ', 'TCP Server is running with PID: ', 'Server TCP avviato con PID: '),
('sendmail', 'subject_alarm_low_gravity', 'Alarm von iSpindel-TCP-Server (%s): Gravity unter Limit gefallen', 'Alarm from iSpindel-TCP-Server (%s): Gravity below limit', 'Allarme dal server-TCP-iSpindle (%s): Densità inferiore al limite'),
('sendmail', 'subject_alarm_svg', 'Alarm von iSpindel-TCP-Server (%s): Vergärungsgrad oberhalb Alarm Limit', 'Alarm from iSpindel-TCP-Server (%s): Apparent attenuation above alarm limit', 'Allarme dal server-TCP-iSpindle (%s): Attenuazione apparente superiore al limite'),
('sendmail', 'subject_status', 'Status Email von iSpindel-TCP-Server (%s)', 'Status Email from iSpindel-TCP-Server (%s)', 'Email di stato dal server-TCP-iSpindle (%s)'),
('settings', 'add_device', 'Individuelle Settings für Device anlegen', 'Add individual settings for device', 'Crea impostazioni individuali per il dispositivo'),
('settings', 'delete_device', 'Device aus individuellen Settings löschen', 'Remove Device from individual Settings', 'Elimina il dispositivo dalle singole impostazioni');
