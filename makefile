# 컴파일러 및 옵션 설정
CC      = g++
CFLAGS  = -Wall -I./include -I./glad/include
LDFLAGS = -lglfw -ldl -lGL

# 소스 파일 분리 (C++와 C 파일을 따로 지정)
SOURCES_CPP = main.cpp
SOURCES_C   = glad/src/glad.c

# 각각의 소스 파일에 대해 객체 파일 이름 지정
OBJECTS_CPP = $(SOURCES_CPP:.cpp=.o)
OBJECTS_C   = $(SOURCES_C:.c=.o)

# 최종 객체 파일 목록
OBJECTS = $(OBJECTS_CPP) $(OBJECTS_C)

TARGET  = myOpenGLApp

# 기본 빌드 타겟
all: $(TARGET)

# 대상 링크
$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJECTS) $(LDFLAGS)

# C++ 소스 파일 컴파일 규칙
%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

# C 소스 파일 컴파일 규칙
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# 클린업 (객체 파일과 빌드된 실행 파일만 삭제)
clean:
	rm -f $(OBJECTS) $(TARGET)
