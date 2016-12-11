//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var numero1: Int = 1

var numero = [1, 23, 12, 23]
var nomes: [String] = ["Sensei", "Pedro II", "Elton", "Pedro I", "Lucas", "Kayo"]

print(nomes)

var marcasDeTelefone = Set<String>()
marcasDeTelefone.insert("iphone")
marcasDeTelefone.insert("moto g")
marcasDeTelefone.insert("moto x")
marcasDeTelefone.insert("windows phone")
marcasDeTelefone.insert("moto g")
marcasDeTelefone.insert("moto g")
marcasDeTelefone.insert("moto maxx")
marcasDeTelefone.insert("galaxy s4")

marcasDeTelefone.remove("iphone")

marcasDeTelefone

var usuario = Dictionary<String, String>()
usuario["nome"] = "Fernando Oliveira"
usuario["email"] = "nandooliveira.al@gmail.com"

usuario

print(usuario["email"] ?? "")

12 + 2
13.0 / 23
23 * 12
23 - 12

for nome in nomes {
    print(nome)
}

for var i in 0..<10 { // for (i = 0; i < 10; i++) {}
    print("Line " + String(i))
}

var i = 0
while i < 10 {
    print("Line " + String(i))
    i += 1
}

repeat {
    print("Line " + String(i))
    i += 1
} while i < 10


func somar(a: Int, b: Int) -> Int {
    return a + b
}

somar(a: 23, b: 34)
somar(a: 23, b: 334)

var meu_opcional:String?

class Animal {
    var nome: String!
    var idada: String!
    
    init(nome: String) {
        self.nome = nome
    }
    
    func dormir () {
        print("estou dormindo")
    }
    
}

var animal = Animal(nome: "Tonho da Lua")
animal.dormir()
print(animal.nome)

class Cachorro: Animal {
    
}

var cachorro = Cachorro(nome: "Dogão")
print(cachorro.nome)
cachorro.dormir()


