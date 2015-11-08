
#ifndef MESSAGE_HANDLER_HPP
#define MESSAGE_HANDLER_HPP

#include <QString>
#include <QAbstractMessageHandler>

class MessageHandler : public QAbstractMessageHandler
{
    public:
        MessageHandler() : QAbstractMessageHandler(0) { }
        QString statusMessage() const { return description; }
        int line() const { return source_location.line(); }
        int column() const { return source_location.column(); }

    protected:
        virtual void handleMessage(QtMsgType message_type,
            QString const & message_description, QUrl const & identifier,
            QSourceLocation const & message_source_location)
        {
            Q_UNUSED(type);
            Q_UNUSED(identifier);

            type = message_type;
            description = message_description;
            source_location = message_source_location;
        }

    private:
        QtMsgType type;
        QString description;
        QSourceLocation source_location;
};

#endif
