package prac1.pkg2.intro;
public class Prac12Intro {
    public static void main(String[] args) {
        int factorial=1;
        for (int i=1; i<=9; i++){
            for (int j=i; j>0; j--){
                factorial*=j;
            }
            System.out.println("Factorial "+i+"!: "+factorial);
            factorial=1;
        }
    }
}