import de.bezier.guido.*;
int NUM_ROWS =5; 
int NUM_COLS=5; 
private MSButton[][] buttons= new MSButton[NUM_ROWS][NUM_COLS]; //2d array of minesweeper buttons
private ArrayList <MSButton> mines = new ArrayList<MSButton>(); //ArrayList of just the minesweeper buttons that are mined


void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
    //your code to initialize buttons goes here
    for (int i = 0 ; i<NUM_ROWS;i++){
  for ( int k = 0 ; k<NUM_COLS;k++){
    buttons[i][k]=new MSButton(i,k);
  }  
  } 
    
    
    setMines();
}
public void setMines()
{
    int ranrow=(int)(Math.random()*(buttons.length)); 
    int rancol=(int)(Math.random()*(buttons[0].length)); 
    if (!mines.contains(buttons[ranrow][rancol])){
      mines.add(buttons[ranrow][rancol]); 
    } 
}

public void draw ()
{
    background( 0 );
    if(isWon() == true)
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    return false;
}
public void displayLosingMessage()
{
    //your code here
}
public void displayWinningMessage()
{
    //your code here
}
public boolean isValid(int r, int c)
{
    return r>0 && r<NUM_ROWS && c>0 && c<NUM_COLS;
    
}
public int countMines(int row, int col)
{
    int numMines = 0;
  
    for (int i = row-1;i<=row+1;i++){
      for ( int k=col-1;k<col+1;k++){
        if (isValid(i,k)){
          if (mines.contains(buttons[i][k])) {
          numMines+=1;
        } } 
        
      } 
    } 
    System.out.println(numMines);  
    return numMines;
}
public class MSButton
{
    private int myRow, myCol;
    private float x,y, width, height;
    private boolean clicked, flagged;
    private String myLabel;
    
    public MSButton ( int row, int col )
    {
         width = 400/NUM_COLS;
         height = 400/NUM_ROWS;
        myRow = row;
        myCol = col; 
        x = myCol*width;
        y = myRow*height;
        myLabel = "";
        flagged = clicked = false;
        Interactive.add( this ); // register it with the manager
    }

    // called by manager
    public void mousePressed () 
    {
        clicked = true;
        if ( mouseButton==RIGHT && clicked==true){
          flagged=false;
          clicked=false;
        else if (mouseButton==RIGHT && clicked==false){
          flagged=true;
          clicked=true;
       // }else{flagged=flagged;
     // clicked=clicked; } 
 
        } if ( mouseButton==LEFT) {
          
        } 
    }
    public void draw () 
    {    
        if (flagged)
            fill(0);
         else if( clicked && mines.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(myLabel,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        myLabel = newLabel;
    }
    public void setLabel(int newLabel)
    {
        myLabel = ""+ newLabel;
    }
    public boolean isFlagged()
    {
        return flagged;
    }
}
