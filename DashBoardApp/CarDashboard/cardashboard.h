#include<QTimer>
#include<QObject>
#include<QVariant>

class CarDashboard:public QObject
{

  Q_OBJECT

public:
     CarDashboard();


 signals:
     void notifyOutsideTemp(int temp);
     void notifyEngineRPM(int engRPM );
     void notifyVehicleSpeed(int speed);
     void notifyFuelLevel(int level);

public slots:
     void GetOutsideTemp();
     void GetEngineRPM();
     void GetVehicleSpeed();
     void GetFuelLevel();

     void startTimer();
     void stopTimer();
     void stopTemprature();
     void stopEngineRPM();
     void stopVehicleSpeed();
     void stopFuelLevel();

     public:
     QTimer timer1,timer2,timer3,timer4;
};
