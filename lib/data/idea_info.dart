class IdeaInfo {
  int? id;  //데이터 컬럼 id
  String title; //아이디어 제목
  String motive; //작성 계기
  String content; //아이디어 내용
  int priority; //아이디어 중요도 점수
  String feedback; //유저피드백사항
  int createdAt; //생성일시(년월일시분으로 표시해야함)

  //생성자
  IdeaInfo({
    this.id,
    required this.title,
    required this.motive,
    required this.content,
    required this.priority,
    required this.feedback,
    required this.createdAt,
  });

  //Map -> key, value로 이루어진 자료형
  //Idea info 객체를 Map으로 변환
  Map<String, dynamic> toMap() {
    return{
      'id' : id,
      'title' : title,
      'motive' : motive,
      'content' : content,
      'priority' : priority,
      'feedback' : feedback,
      'createdAt' : createdAt,
    };
  }
  
  //Map객체를 ideainfo 데이터 클래스로 변환
  factory IdeaInfo.fromMap(Map<String, dynamic> map){
    return IdeaInfo(id: map['id'], title: map['title'], motive: map['motive'], content: map['content'], priority: map['priority'], feedback: map['feedback'], createdAt: map['createdAt'],);
  }
}
