package id.co.quadras.training.ejb.simple;

import javax.ejb.Stateless;

@Stateless(name = "MathUtil", mappedName = "MathUtil")
public class MathImpl implements Math {
    public int add(int firstNumber, int secondNumber) {
        return firstNumber + secondNumber;
    }

    public int substract(int firstNumber, int secondNumber) {
        return firstNumber - secondNumber;
    }

    public int multiply(int firstNumber, int secondNumber) {
        return firstNumber * secondNumber;
    }

    public int divide(int firstNumber, int secondNumber) {
        return firstNumber / secondNumber;
    }
}
