// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StudentDao? _studentDaoInstance;

  FacultyDao? _facultyDaoInstance;

  SubjectDao? _subjectDaoInstance;

  StudentSubjectDao? _studentSubjectDaoInstance;

  FacultySubjectDao? _facultySubjectDaoInstance;

  AdminDao? _admindaoInstance;

  EventDao? _eventDaoInstance;

  BranchDao? _branchdaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `admin_entity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `username` TEXT NOT NULL, `password` TEXT NOT NULL, `name` TEXT NOT NULL, `role` TEXT NOT NULL, `email` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `student_entity` (`rollNo` INTEGER PRIMARY KEY AUTOINCREMENT, `username` TEXT NOT NULL, `password` TEXT NOT NULL, `name` TEXT NOT NULL, `contactNo` TEXT NOT NULL, `fees` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `faculty_entity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `lastname` TEXT NOT NULL, `username` TEXT NOT NULL, `password` TEXT NOT NULL, `salary` REAL NOT NULL, `contactNo` TEXT NOT NULL, `subject` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `subject_entity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `branchId` INTEGER NOT NULL, FOREIGN KEY (`branchId`) REFERENCES `branch_entity` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `student_subject_entity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `studentRollNo` INTEGER NOT NULL, `subjectId` INTEGER NOT NULL, FOREIGN KEY (`studentRollNo`) REFERENCES `student_entity` (`rollNo`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`subjectId`) REFERENCES `subject_entity` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `faculty_subject_entity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `facultyId` INTEGER NOT NULL, `subjectId` INTEGER NOT NULL, FOREIGN KEY (`facultyId`) REFERENCES `faculty_entity` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`subjectId`) REFERENCES `subject_entity` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `event_entity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT NOT NULL, `date` INTEGER NOT NULL, `type` TEXT NOT NULL, `description` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `branch_entity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `name` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StudentDao get studentDao {
    return _studentDaoInstance ??= _$StudentDao(database, changeListener);
  }

  @override
  FacultyDao get facultyDao {
    return _facultyDaoInstance ??= _$FacultyDao(database, changeListener);
  }

  @override
  SubjectDao get subjectDao {
    return _subjectDaoInstance ??= _$SubjectDao(database, changeListener);
  }

  @override
  StudentSubjectDao get studentSubjectDao {
    return _studentSubjectDaoInstance ??=
        _$StudentSubjectDao(database, changeListener);
  }

  @override
  FacultySubjectDao get facultySubjectDao {
    return _facultySubjectDaoInstance ??=
        _$FacultySubjectDao(database, changeListener);
  }

  @override
  AdminDao get admindao {
    return _admindaoInstance ??= _$AdminDao(database, changeListener);
  }

  @override
  EventDao get eventDao {
    return _eventDaoInstance ??= _$EventDao(database, changeListener);
  }

  @override
  BranchDao get branchdao {
    return _branchdaoInstance ??= _$BranchDao(database, changeListener);
  }
}

class _$StudentDao extends StudentDao {
  _$StudentDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _studentEntityInsertionAdapter = InsertionAdapter(
            database,
            'student_entity',
            (StudentEntity item) => <String, Object?>{
                  'rollNo': item.rollNo,
                  'username': item.username,
                  'password': item.password,
                  'name': item.name,
                  'contactNo': item.contactNo,
                  'fees': item.fees
                }),
        _studentEntityUpdateAdapter = UpdateAdapter(
            database,
            'student_entity',
            ['rollNo'],
            (StudentEntity item) => <String, Object?>{
                  'rollNo': item.rollNo,
                  'username': item.username,
                  'password': item.password,
                  'name': item.name,
                  'contactNo': item.contactNo,
                  'fees': item.fees
                }),
        _studentEntityDeletionAdapter = DeletionAdapter(
            database,
            'student_entity',
            ['rollNo'],
            (StudentEntity item) => <String, Object?>{
                  'rollNo': item.rollNo,
                  'username': item.username,
                  'password': item.password,
                  'name': item.name,
                  'contactNo': item.contactNo,
                  'fees': item.fees
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<StudentEntity> _studentEntityInsertionAdapter;

  final UpdateAdapter<StudentEntity> _studentEntityUpdateAdapter;

  final DeletionAdapter<StudentEntity> _studentEntityDeletionAdapter;

  @override
  Future<List<StudentEntity>> findAllStudents() async {
    return _queryAdapter.queryList('SELECT * FROM student_entity',
        mapper: (Map<String, Object?> row) => StudentEntity(
            rollNo: row['rollNo'] as int?,
            username: row['username'] as String,
            password: row['password'] as String,
            name: row['name'] as String,
            contactNo: row['contactNo'] as String,
            fees: row['fees'] as int));
  }

  @override
  Future<StudentEntity?> findStudentByUsernameAndPassword(
    String username,
    String password,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM student_entity WHERE username = ?1 AND password = ?2',
        mapper: (Map<String, Object?> row) => StudentEntity(
            rollNo: row['rollNo'] as int?,
            username: row['username'] as String,
            password: row['password'] as String,
            name: row['name'] as String,
            contactNo: row['contactNo'] as String,
            fees: row['fees'] as int),
        arguments: [username, password]);
  }

  @override
  Future<StudentEntity?> findStudentByUsername(String username) async {
    return _queryAdapter.query(
        'SELECT * FROM student_entity WHERE username = ?1',
        mapper: (Map<String, Object?> row) => StudentEntity(
            rollNo: row['rollNo'] as int?,
            username: row['username'] as String,
            password: row['password'] as String,
            name: row['name'] as String,
            contactNo: row['contactNo'] as String,
            fees: row['fees'] as int),
        arguments: [username]);
  }

  @override
  Future<void> deleteAllStudents() async {
    await _queryAdapter.queryNoReturn('DELETE FROM student_entity');
  }

  @override
  Future<void> insertStudent(StudentEntity student) async {
    await _studentEntityInsertionAdapter.insert(
        student, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateStudent(StudentEntity student) async {
    await _studentEntityUpdateAdapter.update(student, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteStudent(StudentEntity student) async {
    await _studentEntityDeletionAdapter.delete(student);
  }
}

class _$FacultyDao extends FacultyDao {
  _$FacultyDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _facultyEntityInsertionAdapter = InsertionAdapter(
            database,
            'faculty_entity',
            (FacultyEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'lastname': item.lastname,
                  'username': item.username,
                  'password': item.password,
                  'salary': item.salary,
                  'contactNo': item.contactNo,
                  'subject': item.subject
                }),
        _facultyEntityUpdateAdapter = UpdateAdapter(
            database,
            'faculty_entity',
            ['id'],
            (FacultyEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'lastname': item.lastname,
                  'username': item.username,
                  'password': item.password,
                  'salary': item.salary,
                  'contactNo': item.contactNo,
                  'subject': item.subject
                }),
        _facultyEntityDeletionAdapter = DeletionAdapter(
            database,
            'faculty_entity',
            ['id'],
            (FacultyEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'lastname': item.lastname,
                  'username': item.username,
                  'password': item.password,
                  'salary': item.salary,
                  'contactNo': item.contactNo,
                  'subject': item.subject
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FacultyEntity> _facultyEntityInsertionAdapter;

  final UpdateAdapter<FacultyEntity> _facultyEntityUpdateAdapter;

  final DeletionAdapter<FacultyEntity> _facultyEntityDeletionAdapter;

  @override
  Future<List<FacultyEntity>> findAllFaculties() async {
    return _queryAdapter.queryList('SELECT * FROM faculty_entity',
        mapper: (Map<String, Object?> row) => FacultyEntity(
            id: row['id'] as int?,
            lastname: row['lastname'] as String,
            salary: row['salary'] as double,
            username: row['username'] as String,
            password: row['password'] as String,
            name: row['name'] as String,
            contactNo: row['contactNo'] as String,
            subject: row['subject'] as String));
  }

  @override
  Future<FacultyEntity?> findFacultyByUsernameAndPassword(
    String username,
    String password,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM faculty_entity WHERE username = ?1 AND password = ?2',
        mapper: (Map<String, Object?> row) => FacultyEntity(
            id: row['id'] as int?,
            lastname: row['lastname'] as String,
            salary: row['salary'] as double,
            username: row['username'] as String,
            password: row['password'] as String,
            name: row['name'] as String,
            contactNo: row['contactNo'] as String,
            subject: row['subject'] as String),
        arguments: [username, password]);
  }

  @override
  Future<FacultyEntity?> findFacultyByUsername(String username) async {
    return _queryAdapter.query(
        'SELECT * FROM faculty_entity WHERE username = ?1',
        mapper: (Map<String, Object?> row) => FacultyEntity(
            id: row['id'] as int?,
            lastname: row['lastname'] as String,
            salary: row['salary'] as double,
            username: row['username'] as String,
            password: row['password'] as String,
            name: row['name'] as String,
            contactNo: row['contactNo'] as String,
            subject: row['subject'] as String),
        arguments: [username]);
  }

  @override
  Future<void> insertFaculty(FacultyEntity faculty) async {
    await _facultyEntityInsertionAdapter.insert(
        faculty, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateFaculty(FacultyEntity faculty) async {
    await _facultyEntityUpdateAdapter.update(faculty, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteFaculty(FacultyEntity faculty) async {
    await _facultyEntityDeletionAdapter.delete(faculty);
  }
}

class _$SubjectDao extends SubjectDao {
  _$SubjectDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _subjectEntityInsertionAdapter = InsertionAdapter(
            database,
            'subject_entity',
            (SubjectEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'branchId': item.branchId
                }),
        _subjectEntityUpdateAdapter = UpdateAdapter(
            database,
            'subject_entity',
            ['id'],
            (SubjectEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'branchId': item.branchId
                }),
        _subjectEntityDeletionAdapter = DeletionAdapter(
            database,
            'subject_entity',
            ['id'],
            (SubjectEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'branchId': item.branchId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SubjectEntity> _subjectEntityInsertionAdapter;

  final UpdateAdapter<SubjectEntity> _subjectEntityUpdateAdapter;

  final DeletionAdapter<SubjectEntity> _subjectEntityDeletionAdapter;

  @override
  Future<List<SubjectEntity>> getAllSubjects() async {
    return _queryAdapter.queryList('SELECT * FROM subject_entity',
        mapper: (Map<String, Object?> row) => SubjectEntity(
            id: row['id'] as int?,
            name: row['name'] as String,
            branchId: row['branchId'] as int));
  }

  @override
  Future<SubjectEntity?> getSubjectById(int id) async {
    return _queryAdapter.query('SELECT * FROM subject_entity WHERE id = ?1',
        mapper: (Map<String, Object?> row) => SubjectEntity(
            id: row['id'] as int?,
            name: row['name'] as String,
            branchId: row['branchId'] as int),
        arguments: [id]);
  }

  @override
  Future<List<SubjectEntity>> getSubjectsByBranch(int branchId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM subject_entity WHERE branchId = ?1',
        mapper: (Map<String, Object?> row) => SubjectEntity(
            id: row['id'] as int?,
            name: row['name'] as String,
            branchId: row['branchId'] as int),
        arguments: [branchId]);
  }

  @override
  Future<void> insertSubject(SubjectEntity subject) async {
    await _subjectEntityInsertionAdapter.insert(
        subject, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSubject(SubjectEntity subject) async {
    await _subjectEntityUpdateAdapter.update(subject, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSubject(SubjectEntity subject) async {
    await _subjectEntityDeletionAdapter.delete(subject);
  }
}

class _$StudentSubjectDao extends StudentSubjectDao {
  _$StudentSubjectDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _studentSubjectEntityInsertionAdapter = InsertionAdapter(
            database,
            'student_subject_entity',
            (StudentSubjectEntity item) => <String, Object?>{
                  'id': item.id,
                  'studentRollNo': item.studentRollNo,
                  'subjectId': item.subjectId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<StudentSubjectEntity>
      _studentSubjectEntityInsertionAdapter;

  @override
  Future<List<StudentSubjectEntity>> getSubjectsForStudent(
      int studentRollNo) async {
    return _queryAdapter.queryList(
        'SELECT * FROM student_subject_entity WHERE studentRollNo = ?1',
        mapper: (Map<String, Object?> row) => StudentSubjectEntity(
            id: row['id'] as int?,
            studentRollNo: row['studentRollNo'] as int,
            subjectId: row['subjectId'] as int),
        arguments: [studentRollNo]);
  }

  @override
  Future<List<StudentSubjectEntity>> getStudentsForSubject(
      int subjectId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM student_subject_entity WHERE subjectId = ?1',
        mapper: (Map<String, Object?> row) => StudentSubjectEntity(
            id: row['id'] as int?,
            studentRollNo: row['studentRollNo'] as int,
            subjectId: row['subjectId'] as int),
        arguments: [subjectId]);
  }

  @override
  Future<void> insertStudentSubject(StudentSubjectEntity studentSubject) async {
    await _studentSubjectEntityInsertionAdapter.insert(
        studentSubject, OnConflictStrategy.abort);
  }
}

class _$FacultySubjectDao extends FacultySubjectDao {
  _$FacultySubjectDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _facultySubjectEntityInsertionAdapter = InsertionAdapter(
            database,
            'faculty_subject_entity',
            (FacultySubjectEntity item) => <String, Object?>{
                  'id': item.id,
                  'facultyId': item.facultyId,
                  'subjectId': item.subjectId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FacultySubjectEntity>
      _facultySubjectEntityInsertionAdapter;

  @override
  Future<List<FacultySubjectEntity>> getFacultiesForSubject(
      int subjectId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM faculty_subject_entity WHERE subjectId = ?1',
        mapper: (Map<String, Object?> row) => FacultySubjectEntity(
            id: row['id'] as int?,
            facultyId: row['facultyId'] as int,
            subjectId: row['subjectId'] as int),
        arguments: [subjectId]);
  }

  @override
  Future<List<FacultyEntity>> getFacultyForSubject(int subjectId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM faculty_entity f INNER JOIN faculty_subject_entity fs ON f.id = fs.facultyId WHERE fs.subjectId = ?1',
        mapper: (Map<String, Object?> row) => FacultyEntity(id: row['id'] as int?, lastname: row['lastname'] as String, salary: row['salary'] as double, username: row['username'] as String, password: row['password'] as String, name: row['name'] as String, contactNo: row['contactNo'] as String, subject: row['subject'] as String),
        arguments: [subjectId]);
  }

  @override
  Future<void> insertFacultySubject(FacultySubjectEntity facultySubject) async {
    await _facultySubjectEntityInsertionAdapter.insert(
        facultySubject, OnConflictStrategy.abort);
  }
}

class _$AdminDao extends AdminDao {
  _$AdminDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _adminEntityInsertionAdapter = InsertionAdapter(
            database,
            'admin_entity',
            (AdminEntity item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'password': item.password,
                  'name': item.name,
                  'role': item.role,
                  'email': item.email
                }),
        _adminEntityUpdateAdapter = UpdateAdapter(
            database,
            'admin_entity',
            ['id'],
            (AdminEntity item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'password': item.password,
                  'name': item.name,
                  'role': item.role,
                  'email': item.email
                }),
        _adminEntityDeletionAdapter = DeletionAdapter(
            database,
            'admin_entity',
            ['id'],
            (AdminEntity item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'password': item.password,
                  'name': item.name,
                  'role': item.role,
                  'email': item.email
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AdminEntity> _adminEntityInsertionAdapter;

  final UpdateAdapter<AdminEntity> _adminEntityUpdateAdapter;

  final DeletionAdapter<AdminEntity> _adminEntityDeletionAdapter;

  @override
  Future<List<AdminEntity>> findAllAdmins() async {
    return _queryAdapter.queryList('SELECT * FROM admin_entity',
        mapper: (Map<String, Object?> row) => AdminEntity(
            id: row['id'] as int?,
            username: row['username'] as String,
            password: row['password'] as String,
            name: row['name'] as String,
            role: row['role'] as String,
            email: row['email'] as String));
  }

  @override
  Future<AdminEntity?> findAdminByUsernameAndPassword(
    String username,
    String password,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM admin_entity WHERE username = ?1 AND password = ?2',
        mapper: (Map<String, Object?> row) => AdminEntity(
            id: row['id'] as int?,
            username: row['username'] as String,
            password: row['password'] as String,
            name: row['name'] as String,
            role: row['role'] as String,
            email: row['email'] as String),
        arguments: [username, password]);
  }

  @override
  Future<AdminEntity?> findAdminByUsername(String username) async {
    return _queryAdapter.query('SELECT * FROM admin_entity WHERE username = ?1',
        mapper: (Map<String, Object?> row) => AdminEntity(
            id: row['id'] as int?,
            username: row['username'] as String,
            password: row['password'] as String,
            name: row['name'] as String,
            role: row['role'] as String,
            email: row['email'] as String),
        arguments: [username]);
  }

  @override
  Future<void> insertAdmin(AdminEntity admin) async {
    await _adminEntityInsertionAdapter.insert(admin, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAdmin(AdminEntity admin) async {
    await _adminEntityUpdateAdapter.update(admin, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteAdmin(AdminEntity admin) async {
    await _adminEntityDeletionAdapter.delete(admin);
  }
}

class _$EventDao extends EventDao {
  _$EventDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _eventEntityInsertionAdapter = InsertionAdapter(
            database,
            'event_entity',
            (EventEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'date': _dateTimeConverter.encode(item.date),
                  'type': item.type,
                  'description': item.description
                }),
        _eventEntityUpdateAdapter = UpdateAdapter(
            database,
            'event_entity',
            ['id'],
            (EventEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'date': _dateTimeConverter.encode(item.date),
                  'type': item.type,
                  'description': item.description
                }),
        _eventEntityDeletionAdapter = DeletionAdapter(
            database,
            'event_entity',
            ['id'],
            (EventEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'date': _dateTimeConverter.encode(item.date),
                  'type': item.type,
                  'description': item.description
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<EventEntity> _eventEntityInsertionAdapter;

  final UpdateAdapter<EventEntity> _eventEntityUpdateAdapter;

  final DeletionAdapter<EventEntity> _eventEntityDeletionAdapter;

  @override
  Future<List<EventEntity>> getAllEvents() async {
    return _queryAdapter.queryList(
        'SELECT * FROM event_entity ORDER BY date ASC',
        mapper: (Map<String, Object?> row) => EventEntity(
            id: row['id'] as int?,
            title: row['title'] as String,
            date: _dateTimeConverter.decode(row['date'] as int),
            type: row['type'] as String,
            description: row['description'] as String?));
  }

  @override
  Future<List<EventEntity>> getEventsInRange(
    DateTime start,
    DateTime end,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM event_entity WHERE date BETWEEN ?1 AND ?2 ORDER BY date ASC',
        mapper: (Map<String, Object?> row) => EventEntity(id: row['id'] as int?, title: row['title'] as String, date: _dateTimeConverter.decode(row['date'] as int), type: row['type'] as String, description: row['description'] as String?),
        arguments: [
          _dateTimeConverter.encode(start),
          _dateTimeConverter.encode(end)
        ]);
  }

  @override
  Future<List<EventEntity>> getEventsByType(String type) async {
    return _queryAdapter.queryList(
        'SELECT * FROM event_entity WHERE type = ?1 ORDER BY date ASC',
        mapper: (Map<String, Object?> row) => EventEntity(
            id: row['id'] as int?,
            title: row['title'] as String,
            date: _dateTimeConverter.decode(row['date'] as int),
            type: row['type'] as String,
            description: row['description'] as String?),
        arguments: [type]);
  }

  @override
  Future<void> insertEvent(EventEntity event) async {
    await _eventEntityInsertionAdapter.insert(event, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateEvent(EventEntity event) async {
    await _eventEntityUpdateAdapter.update(event, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteEvent(EventEntity event) async {
    await _eventEntityDeletionAdapter.delete(event);
  }
}

class _$BranchDao extends BranchDao {
  _$BranchDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _branchEntityInsertionAdapter = InsertionAdapter(
            database,
            'branch_entity',
            (BranchEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BranchEntity> _branchEntityInsertionAdapter;

  @override
  Future<List<BranchEntity>> getAllBranches() async {
    return _queryAdapter.queryList('SELECT * FROM branch_entity',
        mapper: (Map<String, Object?> row) =>
            BranchEntity(id: row['id'] as int, name: row['name'] as String));
  }

  @override
  Future<String?> getBranchNameBySubject(String subjectName) async {
    return _queryAdapter.query(
        'SELECT b.name      FROM branch_entity b      INNER JOIN subject_entity s ON b.id = s.branchId     WHERE s.name = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        arguments: [subjectName]);
  }

  @override
  Future<void> insertBranch(BranchEntity branch) async {
    await _branchEntityInsertionAdapter.insert(
        branch, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
