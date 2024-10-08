class Student {
  int? id;
  String? studentName;
  String? studentEmail;
  String? studentAddress;
  String? studentPhoneNumber;

  Student({this.id,this.studentName,this.studentEmail,this.studentAddress,this.studentPhoneNumber});

  // convert a Student into a Map
  Map<String,dynamic> toMap() {
    return {
      'id' : id,
      'studName' : studentName,
      'studEmail' : studentEmail,
      'studAddress' : studentAddress,
      'studPhoneNumber' : studentPhoneNumber
    };
  }

  // Convert a Map into a Student Object

  factory Student.fromMap(Map<String,dynamic> map) {
    return Student(
        id: map['id'],
        studentName: map['studName'],
        studentEmail: map['studEmail'],
        studentAddress: map['studAddress'],
        studentPhoneNumber: map['studPhoneNumber'],
    );
  }

  @override
  String toString() {
    return 'Student{id : $id, studName : $studentName, studEmail : $studentEmail ,studAddress : $studentAddress ,studPhoneNumber:$studentPhoneNumber}';
  }
}