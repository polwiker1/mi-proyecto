//SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;


import "../src/calculadora.sol";
import "forge-std/Test.sol";

 contract CalculadoraTests is Test {
    Calculadora calculadora;
    uint256 firstResultado = 100;
    address public admin = vm.addr(1);


    function setUp() public {
calculadora = new Calculadora(firstResultado, admin);

    }
    //unit testing
    function testCheckFirstResultado() public view {
        uint256 firstResultado_ = calculadora.resultado();
        assertEq(firstResultado_, firstResultado);
 }
    function testAddition() public {

     uint256 firstNumber_ = 5;
     uint256 secondNumber_ = 5;
     uint256 resultado_ = calculadora.addition(firstNumber_, secondNumber_);
    
    assertEq(resultado_, firstNumber_ + secondNumber_);

 }

     function testSubtraction() public {

     uint256 firstNumber_ = 10;
     uint256 secondNumber_ = 5;
     uint256 resultado_ = calculadora.subtraction(firstNumber_, secondNumber_);
    
    assertEq(resultado_, firstNumber_ - secondNumber_);

 }
    function testMultiplication() public {


     uint256 firstNumber_ = 10;
     uint256 secondNumber_ = 5;
     uint256 resultado_ = calculadora.multiplication(firstNumber_, secondNumber_);
    
    assertEq(resultado_, firstNumber_ * secondNumber_);
 }
function testCanNotMultiply2LargeNumbers() public {

     uint256 firstNumber_ = type(uint256).max;
     uint256 secondNumber_ = 5;
     vm.expectRevert();
     calculadora.multiplication(firstNumber_, secondNumber_);


 }

 }


 