#include "cardashboard.h"
#include <QDebug>


CarDashboard::CarDashboard(){
   connect(&timer1,&QTimer::timeout,this,&CarDashboard::GetOutsideTemp);
   connect(&timer2,&QTimer::timeout,this,&CarDashboard::GetEngineRPM);
   connect(&timer3,&QTimer::timeout,this,&CarDashboard::GetVehicleSpeed);
   connect(&timer4,&QTimer::timeout,this,&CarDashboard::GetFuelLevel);
}
void CarDashboard::GetOutsideTemp()
{
    static int temp=297;
    if(temp<427){
    emit notifyOutsideTemp(temp);
    temp+=5;
    }
    else
        timer1.stop();
}
void CarDashboard::GetEngineRPM()
{
    static int EngineRPM=320;
     if(EngineRPM<575){
    emit notifyEngineRPM(EngineRPM);
    EngineRPM+=5;
  }
    else
      timer2.stop();
}

void CarDashboard::GetVehicleSpeed()
{
   static int speed=315;
   if(speed<590){
   emit notifyVehicleSpeed(speed);
     speed+=1;
   }
   else {
       timer3.stop();
   }
}

void CarDashboard::GetFuelLevel()
{
     static int level=280;
     if(level<425){
     emit notifyFuelLevel(level);
     level+=5;
     }
     else {
         timer4.stop();
     }
}

void CarDashboard::startTimer()
{
   timer1.start(2000);
   timer2.start(500);
   timer3.start(500);
   timer4.start(10000);
}

void CarDashboard::stopTimer()
{

}
void CarDashboard::stopTemprature()
{
  timer1.stop();
}
void CarDashboard::stopEngineRPM()
{
   timer2.stop();
}

void CarDashboard::stopVehicleSpeed()
{
  timer3.stop();
}

void CarDashboard::stopFuelLevel()
{
 timer4.stop();
}
