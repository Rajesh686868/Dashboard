#include"database.h"
#include "QApplication"
#include "QSqlDatabase"
#include"QSqlQuery"
#include "QSqlError"
#include "QSqlRecord"
#include "QDebug"
#include "QtSql"
#include <QMessageBox>
database::database(const QString & path)
{
    DB=QSqlDatabase::addDatabase("QSQLITE");
    DB.setDatabaseName(path);

    if(!DB.open()){
      qDebug()<<"ERROR: Connection With DataBase Fails";
    }
    else
      qDebug()<<"Connection With DataBase Successed";
    createTable();
    createTable2();
}

database::database(){
//    m_timer=new QTimer;
//    connect(m_timer, &QTimer::timeout, this, &database::checkReminder);
//    m_timer->start(1000);
    createTable();
    createTable2();
}

database::~database()
{
    if(DB.isOpen()){
        DB.close();
    }
}

bool database::isOpen() const
{
  return DB.isOpen();
}

bool database::createTable()
{
    bool success=false;

    QSqlQuery query;
    query.prepare("Create Table Dashboard(PERSON TEXT, COLOR TEXT, WALLPAPER TEXT, NEEDLE TEXT);");
    // qDebug()<<query.exec();
    if(!query.exec()){
        qDebug()<<"Couldn't Create The Table"<<query.lastError();
        success=false;
    }
//    qDebug()<<"create table Successfully";
    return success;
}

bool database::createTable2()
{
    bool success=false;
    QSqlQuery query;
    query.prepare("Create Table DashDB(TIMING TEXT);");
    if(!query.exec()){
        qDebug()<<"Couldn't Create The Table"<<query.lastError();
        success=false;
    }
    return success;
}

void database::addingData(QString PERSON,QString COLOR,QString WALLPAPER, QString NEEDLE)
{

            QSqlQuery table;
            table.prepare("insert into DashBoard(PERSON,COLOR,WALLPAPER,NEEDLE) VALUES(:PERSON,:COLOR,:WALLPAPER,:NEEDLE)");

            table.bindValue(":PERSON",PERSON);
            table.bindValue(":COLOR",COLOR);
            table.bindValue(":WALLPAPER",WALLPAPER);
            table.bindValue(":NEEDLE",NEEDLE);

            if(!table.exec()){
                qDebug()<<table.lastError();
            }
            else{
                qDebug()<<"AddingData";
            }
}

void database::addingTiming(QString TIMING)
{
         QSqlQuery table1;
         table1.prepare("insert into DashDB(TIMING) VALUES(:TIMING)");
         table1.bindValue(":TIMING",TIMING);
         if(!table1.exec()){
             qDebug()<<table1.lastError();
         }
         else{
             qDebug()<<"AddingData";
         }
}

bool database::IsDataExixts(QString PERSON)
{
    bool exists=false;

    QSqlQuery checkQuery;
    checkQuery.prepare("SELECT PERSON FORM DashBoard WHERE PERSON = (:PERSON)");
    checkQuery.bindValue(":PERSON",PERSON);

    if(checkQuery.exec()){
        if(checkQuery.next()){
            exists=true;
        }
    }
    else{
        qDebug()<<"data connection failed:"<<checkQuery.lastError();
    }
    qDebug()<<"exists";
    return exists;
}

//void database::checkReminder()
//{
//    QDateTime currentDateTime=QDateTime::currentDateTime();

//    qDebug()<<"reminder current"<<currentDateTime;
//    qDebug()<<" reminder Selected"<<ReminderTime;

//        int diff=ReminderTime.msecsTo(currentDateTime);

//        if (diff != 0 && diff > -500 && diff < 500) {
//                    QMessageBox::information(nullptr, "Match", "The date and time match!");
//                }

//}

//bool database::addBooksNamequantity(QString &name, int Quantity, QString &Book)
//{
//   qDebug()<<name<<Quantity<<Book<<"hey";
//   bool Success=false;
//   if(!Book.isEmpty()){
//       QSqlQuery Table;
//       Table.prepare("INSERT INTO BMS(name,Quantity,Book) VALUES(:name, :Quantity, :Book) ");
//       Table.bindValue(":name" ,name);
//       Table.bindValue(":Quantity", Quantity);
//       Table.bindValue(":Book",Book);

//       if(Table.exec()){
//          Success=true;
//          qDebug()<<"Data Passed In AddBookName";
//       }
//       else {
//           qDebug()<<"Data Not Passed"<<Table.lastError();
//       }
//   }
//   else{
//       qDebug()<<"Adding data failed;name can not be empty";
//   }
//   return Success;
//}
