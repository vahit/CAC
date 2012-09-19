
import sys
from PyQt4.QtGui import *
from PyQt4.QtCore import *

class Form(QDialog):
    def __init__(self, parent = None):
        super(Form, self).__init__(parent)
        self.setupUI()

    def setupUI(self):
        # Gui objects:
        close_button = QPushButton("Close")
        run_button = QPushButton("Run")
        sleep_start_spbox = QTimeEdit()
        sleep_end_spbox = QTimeEdit()
        sleep_start_label = QLabel(self.tr("&Start time:"))
        sleep_start_label.setBuddy(sleep_start_spbox)
        sleep_end_label = QLabel(self.tr("&End time:"))
        sleep_end_label.setBuddy(sleep_end_spbox)

        # Main dialogs layout. I used a grid layout for now ;-)
        layout = QGridLayout()
        layout.addWidget(sleep_start_label, 0, 0)
        layout.addWidget(sleep_start_spbox, 0, 1)
        layout.addWidget(sleep_end_label, 1, 0)
        layout.addWidget(sleep_end_spbox, 1, 1)
        layout.addWidget(close_button, 2, 0)
        layout.addWidget(run_button, 2, 1)

        self.setLayout(layout)

        # Signals:
        close_button.clicked.connect(qApp.quit)
        run_button.clicked.connect(self.scream_time)
        self.setWindowTitle(self.tr("Clavar Alarm Clock"))

    def scream_time(self):
        message = QMessageBox()
        message.setText(self.tr("Are you waked up enought?"))
        message.setInformativeText(self.tr("If yes, it means I did my job well enought, then press OK and go away ;-)"))
        message.exec_()
        
def main():
    app = QApplication(sys.argv)
    run = Form()
    run.show()
    sys.exit(app.exec_())

if __name__ == "__main__":
    main()