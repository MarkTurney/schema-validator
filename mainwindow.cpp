
#include "mainwindow.hpp"

#include <QLineEdit>
#include <QGridLayout>
#include <QLabel>
#include <QPushButton>
#include <QTextBrowser>
#include <QFileDialog>
#include <QByteArray>
#include <QUrl>
#include <QSourceLocation>
#include <QXmlSchemaValidator>
#include <QMessageBox>
#include <QApplication>

#include <cassert>

#include <QFileInfo>
#include <QDebug>

namespace
{
    QString getParentDirectory(QString const & file_uri)
    {
        QFileInfo file_info(file_uri);
        if (!file_info.exists())
            return "";
        
        return file_info.canonicalPath();
    }
    QString getFileName(QString const & file_uri)
    {
        QFileInfo file_info(file_uri);
        if (!file_info.exists())
            return "";
        
        return file_info.fileName();
    }
}

MainWindow::MainWindow(QWidget *parent)
: QMainWindow(parent),
    content_uri_edit(new QLineEdit(this)),
    schema_uri_edit(new QLineEdit(this)),
    validation_result_browser(new QTextBrowser(this)),
    //: Validation button.
    validate_button(new QPushButton(tr("validate"), this)),
    settings("XmlSoft", "Schema_Validator")
{
    //: Application title.
    setWindowTitle(tr("Schema Validator"));
    setWindowIcon(QIcon(":/icons/schema_validator.png"));
    
    QWidget * central_widget = new QWidget(this);
    setCentralWidget(central_widget);

    QGridLayout * grid = new QGridLayout(central_widget);

    //: Content file selection label.
    grid->addWidget(new QLabel(tr("content:")), 0, 0);
    content_uri_edit->setReadOnly(true);
    connect(content_uri_edit, SIGNAL(textChanged(QString)), SLOT(slotUpdateButtonState()));
    grid->addWidget(content_uri_edit, 0, 1);
    //: Content file browse button text.
    QPushButton * browse_xml_button = new QPushButton(tr("browse"), this);
    connect(browse_xml_button, SIGNAL(clicked()), SLOT(slotBrowseContent()));
    grid->addWidget(browse_xml_button, 0, 2);

    //: Schema file selection label.
    grid->addWidget(new QLabel(tr("schema:")), 1, 0);
    schema_uri_edit->setReadOnly(true);
    connect(schema_uri_edit, SIGNAL(textChanged(QString)), SLOT(slotUpdateButtonState()));
    grid->addWidget(schema_uri_edit, 1, 1);
    //: Schema file browse button text.
    QPushButton * browse_xsd_button = new QPushButton(tr("browse"), this);
    connect(browse_xsd_button, SIGNAL(clicked()), SLOT(slotBrowseSchema()));
    grid->addWidget(browse_xsd_button, 1, 2);

    //: Result section title.
    grid->addWidget(new QLabel(tr("result:")), 2, 0);
    grid->addWidget(validation_result_browser, 2, 1);
    connect(validate_button, SIGNAL(clicked()), SLOT(slotValidateContent()));
    grid->addWidget(validate_button, 2, 2);
    
    xsd_schema.setMessageHandler(&message_handler);
    xsd_schema.load(QUrl("qrc:/schemas/XMLSchema.xsd"));
    assert(xsd_schema.isValid());
    
    readSettings();

    slotUpdateButtonState();
}

MainWindow::~MainWindow()
{
    writeSettings();
}

void MainWindow::slotBrowseContent()
{
    QString starting_dir = content_uri.isEmpty() ? "." : ::getParentDirectory(content_uri);
    QString file_uri = QFileDialog::getOpenFileName(
        //: Content file browsing dialog title.
        this, tr("Choose Content File"), starting_dir,
        //: Content file browsing dialog file description.
        tr("XML Files %1").arg("(*.xml *.xsl *.svg *.xsd *.htm *.html)"));

    QFileInfo file_info(file_uri);
    if (!file_info.exists())
        return;
    
    content_uri = file_uri;
    content_uri_edit->setText(file_info.fileName());

    content_uri_edit->setStyleSheet("");
    validation_result_browser->setStyleSheet("");
}

void MainWindow::slotBrowseSchema()
{
    QString starting_dir = schema_uri.isEmpty() ? "." : ::getParentDirectory(schema_uri);
    QString file_uri = QFileDialog::getOpenFileName(
        //: File browsing dialog title.
        this, tr("Choose Schema File"), starting_dir,
        //: File browsing dialog file description.
        tr("Schema Files %1").arg("(*.xsd)"));

    QFileInfo file_info(file_uri);
    if (!file_info.exists())
        return;
    
    schema_uri = file_uri;
    schema_uri_edit->setText(file_info.fileName());

    content_uri_edit->setStyleSheet("");
    schema_uri_edit->setStyleSheet("");
    validation_result_browser->setStyleSheet("");
}

void MainWindow::slotValidateContent()
{
    // By disabling the validation button we communicate to the user that validation is taking place.
    validate_button->setEnabled(false);

    // Load the content schema.
    QXmlSchema content_schema;
    content_schema.setMessageHandler(&message_handler);
    content_schema.load(QUrl(schema_uri));

    QXmlSchemaValidator schema_validator(xsd_schema);

    // If the schema does not validate against xml schema, or is otherwise invalid.
    if (!schema_validator.validate(QUrl(schema_uri)) || !content_schema.isValid()) {
        //: Invalid schema error message.
        QString error_message = tr("The document \"%1\" is not a valid schema document: %2")
            .arg(getFileName(schema_uri)).arg(message_handler.statusMessage());
        validation_result_browser->setText(error_message);

        content_uri_edit->setStyleSheet("");
        schema_uri_edit->setStyleSheet("* { background-color: rgb(255, 200, 200); }");
        validation_result_browser->setStyleSheet("* { background-color: rgb(255, 200, 200); }");

    } else {
        // If the content is not valid according to the content schema.
        QXmlSchemaValidator content_validator(content_schema);
        if (!content_validator.validate(QUrl(content_uri))) {
            //: Invalid content error message.
            QString error_message = tr("The document \"%1\" is not a valid content document: %2")
                .arg(getFileName(content_uri)).arg(message_handler.statusMessage());
            validation_result_browser->setText(error_message);

            content_uri_edit->setStyleSheet("* { background-color: rgb(255, 200, 200); }");
            schema_uri_edit->setStyleSheet("* { background-color: rgb(200, 255, 200) }");
            validation_result_browser->setStyleSheet("* { background-color: rgb(255, 200, 200); }");

        } else {
            //: Validation result success message.
            validation_result_browser->setText(tr("success"));

            content_uri_edit->setStyleSheet("* { background-color: rgb(200, 255, 200) }");
            schema_uri_edit->setStyleSheet("* { background-color: rgb(200, 255, 200) }");
            validation_result_browser->setStyleSheet("* { background-color: rgb(200, 255, 200) }");
        }
    }

    // Validation is complete.
    validate_button->setEnabled(true);
}


void MainWindow::slotUpdateButtonState()
{
    validation_result_browser->setText("");
    validate_button->setEnabled(!content_uri_edit->text().isEmpty() && !schema_uri_edit->text().isEmpty());
}

void MainWindow::writeSettings()
{
    settings.setValue("appGeometry", geometry());
    settings.setValue("contentUri", content_uri);
    settings.setValue("schemaUri", schema_uri);
}

void MainWindow::readSettings()
{
    // Default window location and dimensions.
    setGeometry(settings.value("appGeometry", QRect(100, 100, 400, 50)).toRect());
    content_uri = settings.value("contentUri").toString();
    content_uri_edit->setText(::getFileName(content_uri));
    schema_uri = settings.value("schemaUri").toString();
    schema_uri_edit->setText(::getFileName(schema_uri));
}
