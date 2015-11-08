
#ifndef MAIN_WINDOW_HPP
#define MAIN_WINDOW_HPP

#include "messagehandler.hpp"

#include <QtGui/QMainWindow>

#include <QString>
#include <QSettings>
#include <QXmlSchema>

#include <utility>

class QLineEdit;
class QPushButton;
class QTextBrowser;

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget * parent = 0);
    ~MainWindow();

private slots:
    void slotBrowseContent();
    void slotBrowseSchema();
    void slotValidateContent();
    void slotUpdateButtonState();

private:
    QLineEdit * content_uri_edit;
    QLineEdit * schema_uri_edit;
    QTextBrowser * validation_result_browser;
    QPushButton * validate_button;

    QXmlSchema xsd_schema;
    MessageHandler message_handler;

    QString content_uri;
    QString schema_uri;
    
    QSettings settings;
    
    void readSettings();
    void writeSettings();
};

#endif
