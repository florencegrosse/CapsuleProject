public class PerfumeManager {

  ArrayList<PerfumeInstruction> instructions;
  //int[] pumpMapping; // A DEFINIR , TROUVER FONCTION SHUFFLE POUR LES ARRAY 

  PerfumeManager() {

    instructions = new ArrayList<PerfumeInstruction>();
  }

  //void createPumpMapping() {

  //  pumpMapping = new int[6];


  //  // CETTE FONCTION CREE UN MAPPING ALEATOIRE DES INDEXS
  //  for (int i = 0; i < 6; i++) {


  //    int rdInteger = (int)random(6);
  //    pumpMapping[i] = -1;
  //    while (arrContains(pumpMapping, rdInteger)) {

  //      rdInteger = (int)random(6);
  //    }

  //    pumpMapping[i] = rdInteger;
  //  }
  //  }


  //boolean arrContains(int[] arr, int val) {

  //  for (int i = 0; i<arr.length; i++) {
  //    if (arr[i] == val)return true;
  //  }

  //  return false;
  //}


  public void storeInstruction(int pumpId, int liquidAmount) {

    instructions.add(new PerfumeInstruction(pumpId, liquidAmount));
  }



  //public class Pump {

  //  Pump() {
  //  }

  //  void spray(int liquidAmount) {
  //  }
  //}

  //public class PerfumeStep {
    
  //  String step;
    
  //  PerfumeStep(String aStep) {
  //   step = aStep;
  //  }
  //}
  
}


  public class PerfumeInstruction 
  {

    int pumpId;
    int liquidAmount;

    PerfumeInstruction(int pI, int la) {

      pumpId = pI;
      liquidAmount = la;
    }
  }