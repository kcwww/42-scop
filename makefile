# 컴파일러 및 옵션 설정
CC      = g++
CFLAGS  = -Wall -I./include -I./glad/include
LDFLAGS = -lglfw -ldl -lGL

# 소스 파일 및 대상 지정
SOURCES = main.cpp glad/src/glad.c
OBJECTS = $(SOURCES:.cpp=.o)
# .c 파일도 객체 파일로 만들어야 하므로 별도 규칙에서 처리

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

# 클린업
clean:
	rm -f $(OBJECTS) $(TARGET)
