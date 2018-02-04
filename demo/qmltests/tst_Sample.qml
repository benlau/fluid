import QtQuick 2.3
import QtTest 1.0
import SnapshotTesting 1.0

Item {
    width: 640
    height: 480

    MyButton {
        id: myButton
    }

    TestCase {
        name: "Sample"
        when: windowShown

        function test_pass() {
            var text;

            text = SnapshotTesting.capture(myButton);
            SnapshotTesting.matchStoredSnapshot("basic", text);

            click(myButton);

            text = SnapshotTesting.capture(myButton);
            SnapshotTesting.matchStoredSnapshot("click", text);
        }
    }

}
