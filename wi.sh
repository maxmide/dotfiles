#!/bin/sh

set -eu

PROJECT="${1:-wx_app}"

mkdir -p "$PROJECT/src" "$PROJECT/include" "$PROJECT/build"
cd "$PROJECT"

# -------------------------
# main.cpp (wxWidgets starter)
# -------------------------
cat > src/main.cpp <<'EOF'
#include <wx/wx.h>

class MyApp : public wxApp {
public:
    bool OnInit() override {
        wxFrame* frame = new wxFrame(nullptr, wxID_ANY, "wxWidgets App");
        frame->Show(true);
        return true;
    }
};

wxIMPLEMENT_APP(MyApp);
EOF

# -------------------------
# Makefile (wx-only build)
# -------------------------
cat > Makefile <<'EOF'
CXX = g++
TARGET = app

CXXFLAGS = -std=c++17 -Wall -Wextra -Iinclude
WXFLAGS = $(shell wx-config --cxxflags)
WXLIBS  = $(shell wx-config --libs)

SRC = $(wildcard src/*.cpp)

all:
	$(CXX) $(CXXFLAGS) $(WXFLAGS) $(SRC) -o $(TARGET) $(WXLIBS)

clean:
	rm -f $(TARGET)

.PHONY: all clean
EOF

# -------------------------
# compile_commands.json (clangd support)
# -------------------------
cat > compile_commands.json <<EOF
[
  {
    "directory": "$(pwd)",
    "file": "src/main.cpp",
    "command": "g++ $(wx-config --cxxflags) -Iinclude src/main.cpp -o app $(wx-config --libs)"
  }
]
EOF

# -------------------------
# optional include header placeholder
# -------------------------
cat > include/app.hpp <<'EOF'
// Optional shared declarations for wxWidgets app
#pragma once
EOF

echo "wxWidgets project created: $PROJECT"
echo "Next:"
echo "  cd $PROJECT"
echo "  make"
