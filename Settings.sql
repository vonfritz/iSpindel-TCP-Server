-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 28. Apr 2019 um 12:36
-- Server Version: 10.3.13-MariaDB-1:10.3.13+maria~trusty-log
-- PHP-Version: 5.5.9-1ubuntu4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `iSpindle`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Settings`
--

CREATE TABLE IF NOT EXISTS `Settings` (
  `Section` varchar(64) CHARACTER SET utf8 NOT NULL,
  `Parameter` varchar(64) CHARACTER SET utf8 NOT NULL,
  `value` varchar(80) CHARACTER SET utf8 NOT NULL,
  `Description_DE` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `Description_EN` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `Description_IT` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Parameter`,`Section`,`value`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `Settings`
--

INSERT INTO `Settings` (`Section`, `Parameter`, `value`, `Description_DE`, `Description_EN`, `Description_IT`) VALUES
('EMAIL', 'ALARMDELTA', '-1', 'Limit für Delta Plato Alarm. Ist die Änderung der letzten 12 Stunden als diesen Wert, wird ein email Alarm gesendet.', 'Limit for Delta Plato alarm. If change within past 12 hours becomes lower, Alarm will be sent.', 'Limite delta allarme plato. Se nelle ultime 12 ore la variazione e inferiore, viene inviata una mail.'),
('EMAIL', 'ALARMLOW', '4', 'Gravity Limit (Plato) für Email Alarm (z.B. 4 -> Alarm, wenn Gravity unter 4 fällt)', 'Lower Gravity Limit for Email Alarm in case acutal gravity is below limit', 'Linite inferiore densità (plato) (p.es. 4 -> allarme quando densità scende al di sotto di quel valore) '),
('EMAIL', 'ALARMSVG', '60', 'Vergärungsgrad Limit (%) für Email Alarm (z.B. 60 Alarm, wenn SVG 60 Prozent erreicht)', 'Limit for Email Alarm of apparent attenuation (e.g. 60 raises an alarm once apparent attenuation reaches 60 percent)', 'Limite superiore allarme attenuazione apparente (p.es. 60 -> allarme quando viene raggiunto il 60 per cento)'),
('BREWFATHER', 'BREWFATHERADDR', 'log.brewfather.net', 'IP Adresse des Brewfather Servers', 'IP Address of the Brewfather Server', 'INDIRIZZO IP del server Brewfather'),
('BREWFATHER', 'BREWFATHERPORT', '80', 'Port des Brewfather Servers', 'Port of Brewfather Server', 'Porta del server Brewfather'),
('BREWFATHER', 'BREWFATHERSUFFIX', '[SG]', 'iSpindel polynom in ... ([SG] = relative Dichte, [PL] = plato)  ', 'iSpindle polynom set for ... ([SG] = specific gravity, [PL] = plato)', 'Polinomio iSpindle configurato per ... ([SG] = densità specifica, [PL] = plato)'),
('BREWFATHER', 'BREWFATHER_TOKEN', 'mytoken', 'Token für Brewfather Server', 'Token for Brewfather Server', 'Token per il server Brewfather'),
('BREWPILESS', 'BREWPILESSADDR', '0.0.0.0:80', 'IPADRESSE:PORT des BrewPiLess Servers', 'IPADDRESS:PORT of the BrewPiLess Servers', 'INDIRIZZOIP:PORTA del server BrewPiLess'),
('BREWSPY', 'BREWSPYADDR', 'brew-spy.com', 'IP Adresse des BrewSpy Servers', 'IP Address of the BrewSpy Server', 'INDIRIZZO IP del server BrewSpy'),
('BREWSPY', 'BREWSPYPORT', '80', 'Port des BrewSpy Servers', 'Port of BrewSpy Server', 'Porta del server BrewSpy'),
('BREWSPY', 'BREWSPY_TOKEN', 'mytoken', 'Token für BrewSpy Server', 'Token for BrewSpy Server', 'Token per il server BrewSpy'),
('CRAFTBEERPI3', 'CRAFTBEERPI3ADDR                 ', 'localhost:5000', 'IPADRESSE:PORT des Craftbeerpi3 servers', 'IPADDRESS:PORT of the Craftbeerpi3 servers', 'INDIRIZZOIP:PORTA del server Craftbeerpi3'),
('CRAFTBEERPI3', 'CRAFTBEERPI3_SEND_ANGLE', '0', 'Falls 1: Weiterleitung des Winkels anstelle der berechneten Gravity. CBPI3 kann dann gravity berechnen', 'If 1: raw angle will be send instead of gravity. Polynom inside craftbeerpi3 can be used for gravity calculation', 'Se 1: viene inviato valore angolo invece della densità.Il polinomio inserito in craftbeerpi3 può calcolare la densità'),
('CSV', 'DATETIME', '1', 'Ein Wert von 1 schreibt einen Excel kompatiblen Zeitstempel in das CSV file', 'Leave this at 1 to include Excel compatible timestamp in CSV', 'Se lasciato a 1 viene incluso un timestamp compatibile nel file CSV'),
('CSV', 'DELIMITER', ';', 'Trennzeichen, dass fuer CSV File genutzt wird', 'Delimiter used for CSV file', 'Separatore usato per il file CSV'),
('EMAIL', 'ENABLEALARMLOW', '0', 'Sende email Alarm, wenn Gravity unter einen bestimmten Wert fällt (0:nein 1: ja)', 'Enable Alarm for low gravity', 'Abilita allarme in caso la densità scenda al di sotto di un valore impostato (0:no 1:si)'),
('EMAIL', 'ENABLEALARMSVG', '0', 'Sende email Alarm, wenn Vergärungsgrad oberhalb eines bestimmten Werts liegt (0:nein 1: ja)', 'Enable Alarm for apparent attenuation above threshhold value (0:no 1:yes)', 'Abilita allarme in caso l\'attenuazione apparente superi un valore impostato (0:no 1:si)'),
('EMAIL', 'ENABLESTATUS', '0', 'Sende tägliche Status Email (0:nein 1: ja)', 'Send daily status email (1: yes 0: no)', 'Abilita l\'Invio di una mail di stato giornaliera (1: si 0: no)'),
('ADVANCED', 'ENABLE_ADDCOLS', '0', 'Enable dynamic columns (do not use this unless you\'re a developer)', 'Enable dynamic columns (do not use this unless you\'re a developer)', 'Abilita colonne dinamiche (non usare se non siete dei sviluppatori)'),
('EMAIL', 'ENABLE_ALARMDELTA', '0', 'Alarm, wenn Plato Veränderung innerhalb der letzten 12 Stunden unter limit fällt (An: 1)', 'Alarm for delta plato (On: 1) If change of plato within past 12 hours falls below setting, email alarm will be sent', 'Abilita allarme se il delta plato scende al di sotto un valore impostato nelle ultime 12 ore.'),
('BREWFATHER', 'ENABLE_BREWFATHER', '0', 'Weiterleitung an Brewfather', 'Forward to Brewfather', 'Inoltro a Brewfather'),
('BREWPILESS', 'ENABLE_BREWPILESS', '0', 'Weiterleitung an BrewPiLess', 'Forward to BrewPiLess', 'Inoltro a BrewPiLess'),
('BREWSPY', 'ENABLE_BREWSPY', '0', 'Weiterleitung an BrewSpy', 'Forward to BrewSpy', 'Inoltro a BrewSpy'),
('CRAFTBEERPI3', 'ENABLE_CRAFTBEERPI3', '0', 'Weiterleitung an CraftbeerPI3', 'Enable forwarding to CraftbeerPi3', 'Inoltro a CraftbeerPI3'),
('CSV', 'ENABLE_CSV', '0', 'Schreiben der Daten in CSV File (1: ja 0: nein)', 'Write Data to CSV file (1: yes 0: no)', 'Scrivere dati in un file CSV (1: si 0: no) '),
('FERMENTRACK', 'ENABLE_FERMENTRACK', '0', 'Weiterleitung der Daten an Fermentrack', 'Forward data to Fermentrack', 'Inotro dati a Fermentrack'),
('FORWARD', 'ENABLE_FORWARD', '0', 'Weiterleitung der Daten an öffentlichen Server oder andere Instanz vom TCP Server', 'Forward to public server or other relay (i.e. another instance of this script)', 'Inoltro a server pubblico o altra istanza di un server TCP'),
('REMOTECONFIG', 'ENABLE_REMOTECONFIG', '0', 'Bei 1: Konfiguration wird vom TCP Server an die Spindel während eines Datentransfers gesendet (noch in der Testung)', 'If enabled, config from TCP server will be send to Spindle during data transfer once (still under testing)', 'Se abilitato, vengono scritti i dati di configurazione sulla Spindel durante un trasferimento (in fase di testing)'),
('UBIDOTS', 'ENABLE_UBIDOTS', '0', 'Weiterleitung der Daten an Ubidots (1: an 0: aus)', '1 to enable output to ubidots', '1 per abilitare inoltro a ubidots '),
('BREWFATHER', 'FAT_USE_ISPINDLE_TOKEN', '0', 'Verwendung des ISpindle Tokens zur Weiterleitung', 'Use token from iSpindle for data forwarding', 'Utilizzare il token sul iSpindle per l\'inoltro dati'),
('FERMENTRACK', 'FERMENTRACKADDR', '0.0.0.0', 'IP Adresse des Fermentrack Servers', 'IP Address of the Fermentrack Server', 'Indirizzo IP del server Fermentrack'),
('FERMENTRACK', 'FERMENTRACKPORT', '80', 'Port des Fermentrack Servers', 'Port of Fermentrack Server', 'Porta del server Fermentrack'),
('FERMENTRACK', 'FERMENTRACK_TOKEN', 'my_token', 'Token für Fermentrack Server', 'Token for Fermentrack Server', 'Token per server Fermentrack'),
('FERMENTRACK', 'FERM_USE_ISPINDLE_TOKEN', '0', 'Verwendung des ISpindle Tokens zur Weiterleitung', 'Use token from iSpindle for data forwarding', 'Uso del token che si trova sulla iSpindle per inoltrare dati'),
('FORWARD', 'FORWARDADDR', '0', 'IP Adresse des anderen Servers', 'IP Adress of the other server', 'Indirizzo IP dell\'altro server'),
('FORWARD', 'FORWARDPORT', '9501', 'Port des anderen Servers', 'Port of the remote server', 'Porta del server remoto'),
('EMAIL', 'FROMADDR', 'your.mail@gmail.com', 'Email Adresse von der eine Nachricht versendet werden soll.', 'email, from which the ', 'Indirizzo email provenienza, inviato da '),
('GENERAL', 'HOST', '0.0.0.0', 'Erlaubter IP Bereich. 0.0.0.0 ermöglicht Verbindungen von überall', 'Allowed IP range. Leave at 0.0.0.0 to allow connections from anywhere', 'Gamma IP concessa. lasciare a 0.0.0.0 per permettere la connessione da ovunque'),
('GENERAL', 'LANGUAGE', 'IT', 'Verwendete Sprache (DE für Deutsch, EN for Englisch, IT für Italienisch)', 'Displayed Language (DE for German, EN for English, IT for Italian)', 'Lingua visualizzata (DE per tedesco, EN per inglese, IT per italiano) '),
('CSV', 'NEWLINE', '\\r\\n', 'Zeichen fuer Zeilenumbruch', 'Newline characters', 'Caratteri Newline'),
('CSV', 'OUTPATH', '/home/pi/iSpindl-srv/csv/', 'Pfad zum schreiben des CSV files. Der filename lautet dann name_id.csv', 'CSV output file path; filename will be name_id.csv', 'Percorso file per CSV; nome file sarà name_id.csv'),
('EMAIL', 'PASSWD', 'yourpassword', 'SMTP Server Passwort', 'SMTP server password', 'Server SMTP password'),
('GENERAL', 'PORT', '9501', 'Port zur Kommunikation zwischen Spindel und TCP Server (muss auch in der Spindel hinterlegt sein)', 'TCP Port to listen to (to be used in iSpindle config as well)', 'Porta TCP per communicazione (da impostare anche nella configurazione iSpindle)'),
('EMAIL', 'SMTPPORT', '587', 'SMTP Server Port (z.B. 587)', 'smpt server port', 'Porta SMTP server (p. es. 587)'),
('EMAIL', 'SMTPSERVER', 'smtp.gmail.com', 'SMTP Server Adresse (z.B. smtp.gmail.com)', 'smtp server address', 'Indirizzo server SMTP'),
('BREWSPY', 'SPY_USE_ISPINDLE_TOKEN', '0', 'Verwendung des ISpindle Tokens zur Weiterleitung', 'Use token from iSpindle for data forwarding', 'Utilizzare il token sul iSpindle per l\'inoltro dati'),
('EMAIL', 'TIMEFRAMESTATUS', '2', 'Zeitraum der letzten Datenübermittlung in Tagen, wenn ein Statusalarm gesendet werden soll', 'Timeframe in days when last spindel data was send and should be displayed.', 'Periodo in giorni dall\'ultimo invio di una mail di allarme'),
('EMAIL', 'TIMESTATUS', '6', 'Uhrzeit in vollen Stunden für tägliche Status Email (z.B. 6 für 6 Uhr morgens)', 'Set time for Status email around full hour. e.g. 6 means 6:00', 'Ora per l\'invio della mail di stato giornaliera p. es. 6 sono le 6:00'),
('EMAIL', 'TOADDR', 'your.mail@gmail.com', 'Email Adresse, an die eine Nachricht gesendet werden soll', 'email address to which the alarm email is sent', 'Indirizzo email a cui inviare la mail di stato/allarme'),
('UBIDOTS', 'UBI_TOKEN', 'my_token', 'UBIDOTS Token. Siehe Anleitung oder ubidots.com', 'global ubidots token, see manual or ubidots.com', 'Token ubidots vedi istruzioni o ubidots.com'),
('UBIDOTS', 'UBI_USE_ISPINDLE_TOKEN', '0', 'Benutzung des in der Spindel gespeicherten Tokens zur Weiterleitung an Ubidots ', '1 to use \"token\" field in iSpindle config (overrides UBI_TOKEN)', 'Utilizzo del token salvato nella iSpindle per l\'inoltro a ubidots');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
