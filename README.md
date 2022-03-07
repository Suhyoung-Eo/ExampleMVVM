# RxSwift_MVVM

## 프로젝트 설명
RxSwift를 사용하여 MVVM 패턴을 적용한 간단한 프로젝트

### 파일 구성
- ViewController
- ViewModel
- Service
- Model
- Repository
- Entity

### MVVM(Model view ViewModel) 패턴 적용 설명
- View(ViewController): 오직 UI에 관한 로직만 관여하며, viewModel에 input만 전달, 변경되며 보여줘야 할 정보는 ViewModel과 binding되어 ViewModel의 비지니스 로직이 담당. 

- ViewModel: UI에 관한 내용은 관여하지 않고, View로부터 받은 input을 Service에 전달하고 해당하는 Model 정보를 받아 화면에서 보여줘야 할 형태로 가공하여 View로 전달.

- Service(Domain): ViewModel부터 받은 input에 대한 응답으로 Repository와 연동하여 Model 정보를 채우고 ViewModel에 전달.

- Model: ViewModel로 전달 되어야 할 데이터

- Repository: Api와 직접 통신하는 부분으로 Etity 정보를 Model로 옮겨주는 역할을 함

- Entity: 가공되지 않은 low data로 해당 정보를 이용하여 Model date 생성

### 각 계층이 바라 보는 방향의 도식화
![KakaoTalk_Photo_2022-02-27-16-44-43](https://user-images.githubusercontent.com/91250216/155873521-521dfc19-c66d-418d-9038-658b90c5af01.png)

### MVVM 장단점
 - 장점
 > 1. View(UI)와 ViewModel 독립적이므로 효율적인 유닛테스트 가능 - TDD 개발 환경
 > 2. 하나의 ViewModel로 여러개의 View를 담당 할 수 있음
 > 3. Service(Domain) 변경없이 View(UI)의 변경이 용이함   
 
 - 단점
 > 1. ViewModel 설계가 쉽지 않음
 > 2. 표준화된 틀이 존재하지 않아 사람마다 이해가 다름

