
using namespace std;
#include<iostream>

bool getNameplateCapacity(double& n);  //prompts the user for nameplate capacity and puts this value in the pass-by-reference variable. Returns true if the nameplate is not zero, false otherwise.
bool checkNameplateCapacity(double n); //returns true if n is in the valid range of 300,...,8,000,000 inclusive. Prints out error message if n is out of range as descrbool getAndCheckWindSpeed(double& w); //prompts the user for wind speed and puts this value in the pass-by-reference parameter. Checks this input and prints error messa$
bool getandCheckWindSpeed (double& w); //prompts the user for wind speed and puts this value in the pass-by-reference parameter. Checks this input and prints error message if out of range.
double calcWattsGenerated(double nameplateCapacity, double windspeed); //): returns calculated watts generated (not kilowatts and not megawatts, but watts)
void printWattsGenerated(double watts); //prints out watts or kilowatts or megawatts generated

double WattTotal;

bool getNameplateCapacity(double& n){
   cout << "Please enter the generator's nameplate capacity in watts(0 to end)";
   cin >> n;
   if(n != 0){
       return true;
   }
   else {
       return false;
   }      
}
bool checkNameplateCapacity(double n){
   if(n<0 && n!=0){
      cout << "Nameplate capacity must be greater than zero.";}
   else if (n>0 && n<300){
      cout << "Nameplate capacity must be between 300 and 8,000,000 watts.";}
   else if(n>8000000){
       cout << "Nameplate capacity must be less than 8,000,000 watts.";}
return 0;
}

bool getandCheckWindSpeed (double& w){
   cout << "Please enter today's average wind speed in miles per hour";
   cin >> w;
   
   if(w<0 && w!=0){
       cout << "Wind speed must be greater than zero.";}
   else if (w>0 && w<6){
       cout << "Wind speed is not sufficient to power the generator.";}
   else if (w>55){
       cout << "Wind speeds too high. The turbine is not operating.";}
return 0;
}

double calcWattsGenerated(double nameplateCapacity, double windspeed){

       WattTotal = nameplateCapacity*(windspeed/28)*(windspeed/28)*(windspeed/28);
return 0;
}

void printWattGenerated(double watts){
   double WattTotal;  
   if(watts<1000){
      cout << "The wind turbine generated" << WattTotal << "watts today.";}
    else if(watts>1000 && watts < 1000000){
      cout << "The wind turbine generated" << WattTotal << "kilowatts today.";}
    else if(watts>1000000){
      cout << "The wind turbine generated" << WattTotal << "megawatts today.";}
}

int main(){

   double nameplateCapacity;   // max can be generated per day by windmill
   double windSpeed;           // average wind speed in mph per day
   bool goodInput;             // maxWatts or average windspeed error
   double watts;               // watts generated in one particular day

   // set precision for all output
   cout.setf( ios::showpoint | ios::fixed );
   cout.precision( 1 );

   // say hello and get maxWatts for the first time
   cout << "Welcome to the Wind Turbine Calculator.\n";
   while ( getNameplateCapacity( nameplateCapacity ) )
   {
      goodInput = checkNameplateCapacity( nameplateCapacity );

      // if good maxWatts
      if ( goodInput )
      {
         goodInput = getAndCheckWindSpeed( windSpeed );

         // if no error in maxWatts and windSpeed then
         // calculate and print watts generated
         if( goodInput )
         {
            watts = calcWattsGenerated( nameplateCapacity, windSpeed );
            printWattsGenerated( watts );
         } // end if no input error in maxWatts and windSpeed
      }// end if good maxWatts
   } // end while maxWatts < 0

   cout << "Thank you for using the Wind Turbine Calculator.\n";
   return( 0 );
}
