
import 'package:cashregister/entity/person.dart';
import 'package:floor/floor.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Person?> findPersonById(int id);
  
  @Query('SELECT * FROM Person order by id desc   limit 1')
  Future<Person?> findLastPerson () ; 

  @insert
  Future<void> insertPerson(Person person);

}