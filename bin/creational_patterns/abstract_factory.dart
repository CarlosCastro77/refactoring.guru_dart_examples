/*
 The Abstract Factory interface declares a set of methods that return
 different abstract products. These products are called a family and are
 related by a high-level theme or concept. Products of one family are usually
 able to collaborate among themselves. A family of products may have several
 variants, but the products of one variant are incompatible with products of
 another.
*/

abstract class AbstractFactory {
  AbstractProductA createProductA();
}

/*
 Concrete Factories produce a family of products that belong to a single
 variant. The factory guarantees that resulting products are compatible. Note
 that signatures of the Concrete Factory's methods return an abstract product,
 while inside the method a concrete product is instantiated.
*/
class ConcreteFactory1 implements AbstractFactory {
  @override
  createProductA() {
    return ConcreteProductA1();
  }
}

/*
 Each distinct product of a product family should have a base interface. All
 variants of the product must implement this interface.
*/
abstract class AbstractProductA {
  String usefulFunctionA();
}

/*
 These Concrete Products are created by corresponding Concrete Factories.
*/
class ConcreteProductA1 implements AbstractProductA {
  @override
  String usefulFunctionA() {
    return 'The result of the product A1.';
  }
}

/*
 The client code works with factories and products only through abstract
 types: AbstractFactory and AbstractProduct. This lets you pass any factory or
 product subclass to the client code without breaking it.
*/
void clientCode(AbstractFactory factory) {
  final productA = factory.createProductA();
  
  print(productA.usefulFunctionA());
}

/*
 The client code can work with any concrete factory class.
*/
void main(List<String> arguments) {
  print('Client: Testing client code with the first factory type...');
  clientCode(ConcreteFactory1());
}
