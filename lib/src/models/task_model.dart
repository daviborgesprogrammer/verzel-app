import 'package:flutter/material.dart';

enum TaskStatus {
  active(1),
  concluded(2),
  deleted(3);

  final int id;
  const TaskStatus(this.id);

  static TaskStatus parse(int id) => values.firstWhere((i) => i.id == id);
}

class Task {
  int? id;
  int? idUser;
  String? title;
  String? deliveryDate;
  String? conclusionDate;
  TaskStatus? status;
  Task({
    this.id,
    this.idUser,
    this.title,
    this.deliveryDate,
    this.conclusionDate,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idUser': idUser,
      'title': title,
      'deliveryDate': deliveryDate,
      'conclusionDate': conclusionDate,
      'status': status!.id,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] != null ? map['id'] as int : null,
      idUser: map['idUser'] != null ? map['idUser'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      deliveryDate:
          map['deliveryDate'] != null ? map['deliveryDate'] as String : null,
      conclusionDate: map['conclusionDate'] != null
          ? map['conclusionDate'] as String
          : null,
      status: map['status'] != null ? TaskStatus.parse(map['status']) : null,
    );
  }

  Task copyWith({
    ValueGetter<int?>? id,
    ValueGetter<int?>? idUser,
    ValueGetter<String?>? title,
    ValueGetter<String?>? deliveryDate,
    ValueGetter<String?>? conclusionDate,
    ValueGetter<TaskStatus?>? status,
  }) {
    return Task(
      id: id != null ? id() : this.id,
      idUser: idUser != null ? idUser() : this.idUser,
      title: title != null ? title() : this.title,
      deliveryDate: deliveryDate != null ? deliveryDate() : this.deliveryDate,
      conclusionDate:
          conclusionDate != null ? conclusionDate() : this.conclusionDate,
      status: status != null ? status() : this.status,
    );
  }
}
