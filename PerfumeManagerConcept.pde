// Perfume Algorithm

//------------------------------------------------------------------------------------------//
// QUESTIONS  
//------------------------------------------------------------------------------------------//
// when to do when a bottle ( corresponding to a pump ) is empty ? 

PerfumeManager perfumeManager;

//------------------------------------------------------------------------------------------//
// PRINCIPLE :
//------------------------------------------------------------------------------------------//

// Each question screen is corresponding to a question

// Each question screen is divided in touching zones

// Each touching zone is corresponding to a liquid amount

// The liquid amount is equal to 10mL at the end

// for example :

// With 5 question screens

// On each touching screen , you spray finalLiquidAmount / number of question screens




//------------------------------------------------------------------------------------------//
// APPLICATION :
//------------------------------------------------------------------------------------------//

// ****** METHOD A --- DIVIDE FINAL LIQUID AMOUNT EQUALLY ON EACH TOUCHING SCREEN ******//


// DIVIDE TOTAL LIQUID AMOUNT BY STEPS METHOD (TOUCHING SCREENS) divideTotalLiquidAmountBySteps(boolean divideEqually = true)

  // On each touching screen , to divideEqually you spray finalLiquidAmount(10) / numberOfQuestionScreen(5) = 2mL >>> STEP LIQUID AMOUNT <<< 
  // These >>> STEP LIQUID AMOUNT <<<  is divided in certain amount of different pumps




// ASSIGN TOUCHING ZONES TO RANDOM PUMPS

  // Each touching zone is corresponding to a random ratio of differents pumps , corresponding
  // to a total of THE DEFINED  step liquid amount ( IN DIVIDE EQUALLY is 2mL ) 

   // For example a ratio can be 50 percent of pump 1 and 50 percent of pump2
   // 1mL of pump1 and 1mL of pump2 (on a specific touching zone )

   // Each touching zone is a 50/50 blend of 2 random pump

    // At the end of the question screen , you get a parameter for the perfume final recipe



// ****** METHOD B --- DIVIDE FINAL LIQUID AMOUNT UNEQUALLY ON EACH TOUCHING SCREEN ******//

// DIVIDE TOTAL LIQUID AMOUNT UNEQUALLY BY STEPS (TOUCHING SCREENS) divideTotalLiquidAmountBySteps(boolean divideEqually = false)

  // Each question screen is corresponding to a ratio of the total final liquid amount 

  // For example with 5 touching screens : 2 / 0 / 1 / 1 / 1  . each of theses numbers is corresponding to a ratio of >>> STEP LIQUID AMOUNT <<<  (2mL)
                                         // 2 * 2 = 4mL / 0 * 2 = 0mL / 1 * 2 = 2mL / 1 * 2 = 2mL / 1 * 2 = 2mL >>> DIFFERENTS VALUES FOR STEP LIQUID AMOUNT <<<
                        

//ASSIGN TOUCHING ZONES TO RANDOM PUMPS 
       
                        // look back, this function is the same than using METHOD A






//-----------------------------------------------------------------------------------------------------//
//---- HOW TO MAKE COMMUNICATION BETWEEN ARDUINO AND PROCESSING ( HARDWARE AND SOFTWARE ) ?  ------//
//------------------------------------------------------------------------------------------------------------//

// Using Serial ( look for Processing library called Serial )




//-----------------------------------------------------------------------------------------------------//
//---- HOW TO GET CONSTANT RANDOMNESS ? ( DEFINE A CONSTANT RANDOM SEED ) -----------------------------------------------------------//



  // randomSeed(3);
  // float random = random(0,10);
  // println(random);



class PerfumeManager {
  
  
  int randomInteger = (int)random(0,5);
  
  int pumpsNumber; 
  
  
  PerfumeManager(int _pumpsNumber){
    
    pumpsNumber = _pumpsNumber;
    
    
  }
    
  
  
  
  
}