cmake_minimum_required(VERSION 3.16)

project(ApiDeneme VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appApiDeneme
    main.cpp
)

qt_add_qml_module(appApiDeneme
    URI ApiDeneme
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES "Ekranlar/ArabaEkrani.qml"
    QML_FILES "Ekranlar/ValeEkrani.qml"
    QML_FILES "Ekranlar/veri.js"
    QML_FILES "Ekranlar/EklemeEkrani.qml"
    QML_FILES "Ekranlar/Deneme.qml"
    QML_FILES "Image/plus.png"
    QML_FILES "Image/refresh.png"
    QML_FILES "Image/refresh1.png"
    QML_FILES "Image/person.png"
    QML_FILES "Image/refresh2.png"
    QML_FILES "Ekranlar/AyrintiEkrani.qml"


)

set_target_properties(appApiDeneme PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appApiDeneme
    PRIVATE Qt6::Quick
)

install(TARGETS appApiDeneme
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
