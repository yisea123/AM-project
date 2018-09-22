/****************************************************************************
** Meta object code from reading C++ file 'feedingmachine.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "stdafx.h"
#include "../../feedingmachine.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'feedingmachine.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_FeedingMachine_t {
    QByteArrayData data[28];
    char stringdata0[311];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_FeedingMachine_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_FeedingMachine_t qt_meta_stringdata_FeedingMachine = {
    {
QT_MOC_LITERAL(0, 0, 14), // "FeedingMachine"
QT_MOC_LITERAL(1, 15, 6), // "NewPos"
QT_MOC_LITERAL(2, 22, 0), // ""
QT_MOC_LITERAL(3, 23, 23), // "IsFeedCompletionChanged"
QT_MOC_LITERAL(4, 47, 7), // "uint8_t"
QT_MOC_LITERAL(5, 55, 16), // "isFeedCompletion"
QT_MOC_LITERAL(6, 72, 16), // "IsFeedOutChanged"
QT_MOC_LITERAL(7, 89, 17), // "IsBlankOutChanged"
QT_MOC_LITERAL(8, 107, 7), // "ReadPos"
QT_MOC_LITERAL(9, 115, 20), // "ReadIsFeedCompletion"
QT_MOC_LITERAL(10, 136, 12), // "moveForwardX"
QT_MOC_LITERAL(11, 149, 1), // "r"
QT_MOC_LITERAL(12, 151, 12), // "moveForwardY"
QT_MOC_LITERAL(13, 164, 12), // "moveForwardZ"
QT_MOC_LITERAL(14, 177, 13), // "moveBackwardX"
QT_MOC_LITERAL(15, 191, 13), // "moveBackwardY"
QT_MOC_LITERAL(16, 205, 13), // "moveBackwardZ"
QT_MOC_LITERAL(17, 219, 7), // "moveUpA"
QT_MOC_LITERAL(18, 227, 9), // "moveDownA"
QT_MOC_LITERAL(19, 237, 7), // "autoRun"
QT_MOC_LITERAL(20, 245, 11), // "enableServo"
QT_MOC_LITERAL(21, 257, 12), // "disableServo"
QT_MOC_LITERAL(22, 270, 5), // "HomeX"
QT_MOC_LITERAL(23, 276, 5), // "HomeY"
QT_MOC_LITERAL(24, 282, 5), // "HomeZ"
QT_MOC_LITERAL(25, 288, 5), // "HomeA"
QT_MOC_LITERAL(26, 294, 8), // "GoToNext"
QT_MOC_LITERAL(27, 303, 7) // "AUTORUN"

    },
    "FeedingMachine\0NewPos\0\0IsFeedCompletionChanged\0"
    "uint8_t\0isFeedCompletion\0IsFeedOutChanged\0"
    "IsBlankOutChanged\0ReadPos\0"
    "ReadIsFeedCompletion\0moveForwardX\0r\0"
    "moveForwardY\0moveForwardZ\0moveBackwardX\0"
    "moveBackwardY\0moveBackwardZ\0moveUpA\0"
    "moveDownA\0autoRun\0enableServo\0"
    "disableServo\0HomeX\0HomeY\0HomeZ\0HomeA\0"
    "GoToNext\0AUTORUN"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_FeedingMachine[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      23,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,  129,    2, 0x06 /* Public */,
       3,    1,  130,    2, 0x06 /* Public */,
       6,    1,  133,    2, 0x06 /* Public */,
       7,    1,  136,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       8,    0,  139,    2, 0x0a /* Public */,
       9,    0,  140,    2, 0x0a /* Public */,
      10,    1,  141,    2, 0x0a /* Public */,
      12,    1,  144,    2, 0x0a /* Public */,
      13,    1,  147,    2, 0x0a /* Public */,
      14,    1,  150,    2, 0x0a /* Public */,
      15,    1,  153,    2, 0x0a /* Public */,
      16,    1,  156,    2, 0x0a /* Public */,
      17,    1,  159,    2, 0x0a /* Public */,
      18,    1,  162,    2, 0x0a /* Public */,
      19,    1,  165,    2, 0x0a /* Public */,
      20,    0,  168,    2, 0x0a /* Public */,
      21,    0,  169,    2, 0x0a /* Public */,
      22,    0,  170,    2, 0x0a /* Public */,
      23,    0,  171,    2, 0x0a /* Public */,
      24,    0,  172,    2, 0x0a /* Public */,
      25,    0,  173,    2, 0x0a /* Public */,
      26,    0,  174,    2, 0x0a /* Public */,
      27,    0,  175,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 4,    5,
    QMetaType::Void, 0x80000000 | 4,    5,
    QMetaType::Void, 0x80000000 | 4,    5,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,   11,
    QMetaType::Void, QMetaType::Bool,   11,
    QMetaType::Void, QMetaType::Bool,   11,
    QMetaType::Void, QMetaType::Bool,   11,
    QMetaType::Void, QMetaType::Bool,   11,
    QMetaType::Void, QMetaType::Bool,   11,
    QMetaType::Void, QMetaType::Bool,   11,
    QMetaType::Void, QMetaType::Bool,   11,
    QMetaType::Void, QMetaType::Bool,   11,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void FeedingMachine::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        FeedingMachine *_t = static_cast<FeedingMachine *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->NewPos(); break;
        case 1: _t->IsFeedCompletionChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        case 2: _t->IsFeedOutChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        case 3: _t->IsBlankOutChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        case 4: _t->ReadPos(); break;
        case 5: _t->ReadIsFeedCompletion(); break;
        case 6: _t->moveForwardX((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 7: _t->moveForwardY((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 8: _t->moveForwardZ((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 9: _t->moveBackwardX((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 10: _t->moveBackwardY((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 11: _t->moveBackwardZ((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 12: _t->moveUpA((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 13: _t->moveDownA((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 14: _t->autoRun((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 15: _t->enableServo(); break;
        case 16: _t->disableServo(); break;
        case 17: _t->HomeX(); break;
        case 18: _t->HomeY(); break;
        case 19: _t->HomeZ(); break;
        case 20: _t->HomeA(); break;
        case 21: _t->GoToNext(); break;
        case 22: _t->AUTORUN(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (FeedingMachine::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&FeedingMachine::NewPos)) {
                *result = 0;
            }
        }
        {
            typedef void (FeedingMachine::*_t)(uint8_t );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&FeedingMachine::IsFeedCompletionChanged)) {
                *result = 1;
            }
        }
        {
            typedef void (FeedingMachine::*_t)(uint8_t );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&FeedingMachine::IsFeedOutChanged)) {
                *result = 2;
            }
        }
        {
            typedef void (FeedingMachine::*_t)(uint8_t );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&FeedingMachine::IsBlankOutChanged)) {
                *result = 3;
            }
        }
    }
}

const QMetaObject FeedingMachine::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_FeedingMachine.data,
      qt_meta_data_FeedingMachine,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *FeedingMachine::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FeedingMachine::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_FeedingMachine.stringdata0))
        return static_cast<void*>(const_cast< FeedingMachine*>(this));
    return QObject::qt_metacast(_clname);
}

int FeedingMachine::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 23)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 23;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 23)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 23;
    }
    return _id;
}

// SIGNAL 0
void FeedingMachine::NewPos()
{
    QMetaObject::activate(this, &staticMetaObject, 0, Q_NULLPTR);
}

// SIGNAL 1
void FeedingMachine::IsFeedCompletionChanged(uint8_t _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void FeedingMachine::IsFeedOutChanged(uint8_t _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void FeedingMachine::IsBlankOutChanged(uint8_t _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}
QT_END_MOC_NAMESPACE
