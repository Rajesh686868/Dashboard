#pragma once
#include <QtSql/QSqlDatabase>
#include <QString>
#include <QObject>
#include<QTimer>
#include <QList>
#include <QDateTime>

class database:public QObject
{
    Q_OBJECT
public:
     database(const QString& );
     database();
     ~database();
     bool isOpen() const;
     bool createTable();
     bool createTable2();
     bool IsDataExixts(QString);


public slots:
     void addingData(QString PERSON,QString COLOR,QString WALLPAPER,QString NEEDLE);
     void addingTiming(QString TIMING);
//     void checkReminder();
private:
    QSqlDatabase  DB;
   // QDateTime ReminderTime;
  //  QList<QDateTime> m_reminderTimes;
    QTimer *m_timer;
};
