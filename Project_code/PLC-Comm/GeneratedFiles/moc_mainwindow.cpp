/****************************************************************************
** Meta object code from reading C++ file 'mainwindow.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "stdafx.h"
#include "../../mainwindow.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mainwindow.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_MainWindow_t {
    QByteArrayData data[15];
    char stringdata0[287];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_MainWindow_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_MainWindow_t qt_meta_stringdata_MainWindow = {
    {
QT_MOC_LITERAL(0, 0, 10), // "MainWindow"
QT_MOC_LITERAL(1, 11, 23), // "on_pBInspection_clicked"
QT_MOC_LITERAL(2, 35, 0), // ""
QT_MOC_LITERAL(3, 36, 22), // "on_pBShowImage_clicked"
QT_MOC_LITERAL(4, 59, 24), // "on_pBMakeTemplet_clicked"
QT_MOC_LITERAL(5, 84, 31), // "on_pBShowFeedingMachine_clicked"
QT_MOC_LITERAL(6, 116, 32), // "on_pBShowBlankingMachine_clicked"
QT_MOC_LITERAL(7, 149, 17), // "on_pBTest_pressed"
QT_MOC_LITERAL(8, 167, 18), // "on_pBTest_released"
QT_MOC_LITERAL(9, 186, 21), // "FeedCompletionChanged"
QT_MOC_LITERAL(10, 208, 7), // "uint8_t"
QT_MOC_LITERAL(11, 216, 16), // "isFeedCompletion"
QT_MOC_LITERAL(12, 233, 14), // "FeedoutChanged"
QT_MOC_LITERAL(13, 248, 22), // "BlankCompletionChanged"
QT_MOC_LITERAL(14, 271, 15) // "BlankoutChanged"

    },
    "MainWindow\0on_pBInspection_clicked\0\0"
    "on_pBShowImage_clicked\0on_pBMakeTemplet_clicked\0"
    "on_pBShowFeedingMachine_clicked\0"
    "on_pBShowBlankingMachine_clicked\0"
    "on_pBTest_pressed\0on_pBTest_released\0"
    "FeedCompletionChanged\0uint8_t\0"
    "isFeedCompletion\0FeedoutChanged\0"
    "BlankCompletionChanged\0BlankoutChanged"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MainWindow[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      11,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   69,    2, 0x0a /* Public */,
       3,    0,   70,    2, 0x0a /* Public */,
       4,    0,   71,    2, 0x0a /* Public */,
       5,    0,   72,    2, 0x0a /* Public */,
       6,    0,   73,    2, 0x0a /* Public */,
       7,    0,   74,    2, 0x0a /* Public */,
       8,    0,   75,    2, 0x0a /* Public */,
       9,    1,   76,    2, 0x0a /* Public */,
      12,    1,   79,    2, 0x0a /* Public */,
      13,    1,   82,    2, 0x0a /* Public */,
      14,    1,   85,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 10,   11,
    QMetaType::Void, 0x80000000 | 10,   11,
    QMetaType::Void, 0x80000000 | 10,   11,
    QMetaType::Void, 0x80000000 | 10,   11,

       0        // eod
};

void MainWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        MainWindow *_t = static_cast<MainWindow *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->on_pBInspection_clicked(); break;
        case 1: _t->on_pBShowImage_clicked(); break;
        case 2: _t->on_pBMakeTemplet_clicked(); break;
        case 3: _t->on_pBShowFeedingMachine_clicked(); break;
        case 4: _t->on_pBShowBlankingMachine_clicked(); break;
        case 5: _t->on_pBTest_pressed(); break;
        case 6: _t->on_pBTest_released(); break;
        case 7: _t->FeedCompletionChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        case 8: _t->FeedoutChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        case 9: _t->BlankCompletionChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        case 10: _t->BlankoutChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObject MainWindow::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_MainWindow.data,
      qt_meta_data_MainWindow,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *MainWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MainWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_MainWindow.stringdata0))
        return static_cast<void*>(const_cast< MainWindow*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int MainWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 11)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 11;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
