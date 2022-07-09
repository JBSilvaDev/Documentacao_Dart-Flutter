enum TaskFilterEnum {
  today,
  tomorrow,
  week,
}

extension TaskFilterDescription on TaskFilterEnum {
  String get description {
    switch (this) {
      case TaskFilterEnum.today:
        return ' de hoje';
        break;
      case TaskFilterEnum.tomorrow:
        return 'de amanhã';
        break;
      case TaskFilterEnum.week:
        return 'da semana';
        break;
    }
  }
}
