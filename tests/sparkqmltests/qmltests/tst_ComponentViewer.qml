import QtQuick 2.0
import QtTest 1.0
import Spark.workers 1.0
import Spark.stores 1.0
import Spark.sys 1.0
import Shell 1.0
import Spark.views.components 1.0

Item {

    TestCase {
        name: "ComponentViewer"

        ComponentViewer {
            id: viewer;
        }

        function waitUntilTimeout(callback, timeout) {
            if (timeout === undefined) {
                timeout = 1000;
            }

            while (!callback() && timeout > 0) {
                wait(10);
                timeout -= 10;
            }

            return timeout > 0;
        }

        function test_reload_withError() {
            viewer.load(Qt.resolvedUrl("../sample/SyntaxError.qml"));
            compare(viewer.errorString, "");

            compare(waitUntilTimeout(function() {
               return viewer.errorString == ""
            }), true);

            viewer.reload();
            // Before it is done, it should clear the errorString
            compare(viewer.errorString === "", true);

            compare(waitUntilTimeout(function() {
               return viewer.errorString == ""
            }), true);
        }

    }
}
