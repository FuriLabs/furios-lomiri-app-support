import QtQml 2.12

import Lomiri.DownloadManager 1.2 as LDM
import Ubuntu.DownloadManager.Private 1.2

LDM.SingleDownload {
    Component.onCompleted: {
        DeprecationPrinter.printIt();
    }
}
