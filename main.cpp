#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <iostream>

int main() {
    // GLFW 초기화
    if (!glfwInit()) {
        std::cerr << "Failed to initialize GLFW" << std::endl;
        return -1;
    }

    
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    #ifdef __APPLE__
        glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
    #endif

    // 창 생성
    GLFWwindow* window = glfwCreateWindow(800, 600, "42 scop", nullptr, nullptr);
    if (!window) {
        std::cerr << "Failed to create GLFW window" << std::endl;
        glfwTerminate();
        return -1;
    }
    glfwMakeContextCurrent(window);

    // GLAD 초기화: glfwGetProcAddress를 이용하여 OpenGL 함수 포인터를 로드합니다.
    if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress)) {
        std::cerr << "Failed to initialize GLAD" << std::endl;
        glfwDestroyWindow(window);
        return -1;
    }

    // OpenGL 뷰포트 설정
    int width, height;
    glfwGetFramebufferSize(window, &width, &height);
    glViewport(0, 0, width, height);

    // 메인 루프
    while (!glfwWindowShouldClose(window)) {
        // ESC 키 입력 시 창 종료
        if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
            glfwSetWindowShouldClose(window, true);

        // 화면 초기화: 배경색 지정 (어두운 파란색 계열)
        glClearColor(0.2f, 0.2f, 0.3f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT);

        // 버퍼 교체 및 이벤트 처리
        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    // 종료 처리
    glfwDestroyWindow(window);
    glfwTerminate();
    return 0;
}
