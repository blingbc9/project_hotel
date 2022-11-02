# JAVA SPRING PROJECT

## 호텔예약 서비스 "둘이놀자" Backend

만들고 싶은 프로젝트가 있을 때 함께 만들어갈 동료를 구하는 공간
<br>
잠잠했던 여행 바람이 여름을 맞이하며 서서히 불기 시작했습니다. 펜데믹 초기에는 ‘여행’이라는 컨텐츠 자체 수요가 하락할 수밖에 없는 상황이었습니다. 그러나 현재 단체 여행의 수요는 다소 조심스러울지라도 소규모 여행, 1인 여행 컨텐츠 수요는 점차 상승하고 있는 추세입니다. 이에 발 맞추어, 호텔 예약 웹서비스를 만들어   보았습니다.


<br>

## 진행기간

- 2022.08.01(화) ~ 2022.08.30(수)
  <br>

## ⚙ 주요 기능

#### API설계 [노션](https://cyber-biology-9fd.notion.site/c303f02b79fc4506a025145a7adc4701)

#### WIREFRAME [PIGMA](https://www.figma.com/file/B6WEXes2RDdsOecbfTQKqP/%EB%AF%B8%EB%8B%88%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8?node-id=0%3A1)

### 1. 회원가입 / 로그인
    - 회원 가입 시 아이디/닉네임 중복검사
    - JWT 인증방식을 통한 로그인 구현
    - 로그인 실패 시 Handler를 통해 에러메세지 전달
### 2. 메인 페이지 (게시글 목록)
    - CRUD
    - 사용자가 모집 현황을 알 수 있도록 표시
    - 페이지네이션

### 3. 상세 페이지
    - 유저 스택에 따른 참여 카운트
    - 참여버튼 다시 선택 시 참여 취소.
    - 인원이 다 찼을 경우 더이상 참여 불가.
    - 코멘트 CRUD

<br>

## 🔨 개발 툴

<a href="" target="_blank"><img src="https://img.shields.io/badge/React-61DAFB?style=flat-square&logo=React&logoColor=white"/></a>
<a href="" target="_blank"><img src="https://img.shields.io/badge/Redux-764ABC?style=flat-square&logo=Redux&logoColor=white"/></a>
<img src="https://img.shields.io/badge/gradle-02303A?style=for-the-badge&logo=gradle&logoColor=white">
<img src="https://img.shields.io/badge/Springboot-6DB33F?style=for-the-badge&logo=Springboot&logoColor=white">
<img src= "https://img.shields.io/badge/IntelliJIDEA-000000.svg?style=for-the-badge&logo=intellij-idea&logoColor=white" width="110" height="30"/>

<br>


## 👨‍👩‍👧 팀원

|  이름  |                          깃허브 주소                           |       포지션       |
| :----: | :------------------------------------------------------------: | :----------------: |
| 김빛찬 |      [https://github.com/blingbc9](https://github.com/blingbc9)      |    백엔드(마이페이지-호스트 게스트)   |
| 김지수 | []()   |    백엔드(게시판, 공지사항)   |
| 김형욱 |   []()   |    백엔드(예약 관리)   |
| 이원표 |  []()|    백엔드(메인페이지, 관리자)   |
| 정인아 |  []()  |  벡엔드(회원 관리) |


**BacK End** : https://github.com/blingbc9/project_hotel




<br>





<br>

<h3 align="center"><b>📂 Project Directory Structure 📁</b></h3>

<pre>
<code>
/com.sparta.Webmini2
  └──/controller
     ├── /BackController.java
     ├── /CommentController.java
     ├── /FrontController.java
     ├── /PostController.java
     └── /UserController.java
  └──/dto
     ├── /BackRequestDto.java
     ├── /BackResponseDto.java
     ├── /CommentRequestDto.java
     ├── /CommentResponseDto.java
     ├── /FrontRequestDto.java
     ├── /FrontResponseDto.java
     ├── /PostRequestDto.java
     ├── /PostResponseDto.java
     ├── /ResponseDto.java
     └── /SignupRequestDto.java
  └──/model
     ├── /Back.java
     ├── /Comment.java
     ├── /Front.java
     ├── /Post.java
     ├── /Timestamped.java
     └── /User.java
  └──/repository
     ├── /BackRepository.java
     ├── /CommentRepository.java
     ├── /FrontRepository.java
     ├── /PostRepository.java
     └── /UserRepository.java
  └──/security
     └── /filter
         ├── /FormLoginFilter.java
         └── /JwtAuthFilter.java
     └── /jwt
         ├── /HeaderTokenExtractor.java
         ├── /JwtDecoder.java
         ├── /JwtPreProcessingToken.java
         └── /JwtTokenUtils.java
     └── /provider
         ├── /AuthFailureHandler.java
         ├── /FilterSkipMatcher.java
         ├── /FormLoginSuccessHandler.java
         ├── /UserDetailsImpl.java
         ├── /UserDetailsServiceImpl.java
         └── /WebSecurityConfig.java
  └──/service
     ├── /BackService.java
     ├── /CommentService.java
     ├── /FrontService.java
     ├── /PostService.java
     └── /UserService.java
  └──/validator
     └── /UserInfoValidator.java
  └──/Mini22Application.java
</code>
</pre>
