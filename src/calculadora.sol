//SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Calculadora {
    //variables
    uint256 public resultado;
    address public admin;
    //events
    event Addition(uint256 firstNumber_, uint256 secondNumber_, uint256 resultado_);
    event Subtraction(uint256 firstNumber_, uint256 secondNumber_, uint256 resultado_);
    event Multiplication(uint256 firstNumber_, uint256 secondNumber_, uint256 resultado_);
    event Division(uint256 firstNumber_, uint256 secondNumber_, uint256 resultado_);
    //modifiers
    modifier onlyAdmin() {
        require(msg.sender == admin, "Not allowed");
        _;
    }

    constructor(uint256 firstResult_, address admin_) {
        resultado = firstResult_;
        admin = admin_;
    }

    //funcion suma
    //addition
    function addition(uint256 firstNumber_, uint256 secondNumber_) external returns (uint256 resultado_) {
        resultado_ = firstNumber_ + secondNumber_;
        resultado = resultado_;
        emit Addition(firstNumber_, secondNumber_, resultado_);
    }

    //funcion sustraccion
    function subtraction(uint256 firstNumber_, uint256 secondNumber_) external returns (uint256 resultado_) {
        resultado_ = firstNumber_ - secondNumber_;
        resultado = resultado_;
        emit Subtraction(firstNumber_, secondNumber_, resultado_);
        //multiplicacion
    }

    function multiplication(uint256 firstNumber_, uint256 secondNumber_) external returns (uint256 resultado_) {
        resultado_ = firstNumber_ * secondNumber_;
        resultado = resultado_;
        emit Multiplication(firstNumber_, secondNumber_, resultado_);
        //division
    }

    function division(uint256 firstNumber_, uint256 secondNumber_) external onlyAdmin returns (uint256 resultado_) {
        resultado_ = firstNumber_ / secondNumber_;
        resultado = resultado_;
        emit Division(firstNumber_, secondNumber_, resultado_);
    }
}
