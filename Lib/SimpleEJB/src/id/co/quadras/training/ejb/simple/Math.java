package id.co.quadras.training.ejb.simple;

import javax.ejb.Remote;

@Remote
public interface Math {
    public int add(int firstNumber, int secondNumber);
    public int substract(int firstNumber, int secondNumber);
    public int multiply(int firstNumber, int secondNumber);
    public int divide(int firstNumber, int secondNumber);
}
