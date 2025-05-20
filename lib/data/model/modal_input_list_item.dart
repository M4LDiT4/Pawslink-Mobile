class ModalInputListItem {
  final String title;
  final String subtitle;

  ModalInputListItem({
    required this.title,
    required this.subtitle
  });


  String getTitle(){
    return title;
  }

  String getSubTitle(){
    return subtitle;
  }

  String getValueInString(){
    return '$title, $subtitle';
  }
}