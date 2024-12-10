
import 'package:floor/floor.dart';

@Entity( )
class Person {
  @primaryKey
  final int id ;
  final String name ;
  final String? remark ;
  Person( { required  this.id ,required  this.name , this.remark});
}