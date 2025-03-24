/*
 * Copyright (C) 2022 UBports Foundation.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of version 3 of the GNU Lesser General Public
 * License as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

pragma Singleton

import QtQml 2.12

LoggingCategory {
    id: lcDeprecation
    name: "lomiri.deprecations"
    defaultLogLevel: LoggingCategory.Warning

    property bool printed: false

    function printIt() {
        if (!printed) {
            console.debug(lcDeprecation,
                "Ubuntu.DownloadManager is deprecated and is provided for compatibility. " +
                "Please use Lomiri.DownloadManager when possible"
            );

            printed = true;
        }
    }
}
