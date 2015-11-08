
#include "utility.hpp"
#include "mainwindow.hpp"

#include <QtGui/QApplication>
#include <QTranslator>
#include <QString>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QTranslator translator;
    
    QString translation_uri = utility::locale::getSystemTranslationUri();
    if (!translation_uri.isEmpty()) {
        translator.load(translation_uri);
        app.installTranslator(&translator);
    }

    MainWindow window;
    window.show();

    return app.exec();
}
