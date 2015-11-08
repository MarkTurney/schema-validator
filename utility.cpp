
#include "utility.hpp"

#include <QLocale>
#include <QFileInfo>

namespace
{
    QString languageToTranslationUri(QString const & language)
    {
        return ":/translations/" + language + ".qm";
    }
}

QString utility::locale::getSystemTranslationUri()
{
    QLocale system_locale = QLocale::system();
    QString language = QLocale::languageToString(system_locale.language()).toLower();
    QString tranlation_uri = ::languageToTranslationUri(language);
    QFileInfo file_info(tranlation_uri);
    if (file_info.exists())
        return tranlation_uri;

    return QString();
}
