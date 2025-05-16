enum AnimalSex {male, female}

extension AnimalSexExtension on AnimalSex {
  String get label{
    switch(this){
      case AnimalSex.male:
        return "Male";
      case AnimalSex.female:
        return "Female";
    }

  }
}