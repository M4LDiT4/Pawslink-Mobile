class ModalInputListItem {
  final String title;
  final String subtitle;
  //actual data for the item that is in json format
  //this will be used to interface different modal strategies
  final Map<String, dynamic> data;

  ModalInputListItem({
    required this.title,
    required this.subtitle,
    required this.data
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

  Map<String, dynamic> getDataInMap(){
    return data;
  }
}