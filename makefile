CXX = clang++
ccache_CXX = ccache clang++
CC  = clang

CXXFLAGS  = -Werror 
CXXFLAGS += -Wall
CXXFLAGS += -Wpedantic  
CXXFLAGS += -O0 
CXXFLAGS += -g 
CXXFLAGS += -Iincludes

CFLAGS   = -Werror -Wall -g

SRC_DIR = src

SOURCE = $(SRC_DIR)/main.cpp \
		 $(SRC_DIR)/camera.cpp \
		 $(SRC_DIR)/mesh.cpp \
		 $(SRC_DIR)/model.cpp \
		 $(SRC_DIR)/shader.cpp \
		 $(SRC_DIR)/texture.cpp \
		 $(SRC_DIR)/window.cpp \
		 $(SRC_DIR)/skybox.cpp \
		 $(SRC_DIR)/grid.cpp

DEPS = -lglfw -lGL -ldl -lassimp
TARGET = main 

build: $(SOURCE) 
	$(ccache_CXX) $(CXXFLAGS) $(SOURCE) glad.o -o $(TARGET) $(DEPS)

run: build	
	./$(TARGET) 

clean:
	rm -rf $(TARGET)