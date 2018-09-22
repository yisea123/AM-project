/****************************************************************************
** Meta object code from reading C++ file 'qmvc1000mf.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "stdafx.h"
#include "../../qmvc1000mf.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'qmvc1000mf.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_QMVC1000mf_t {
    QByteArrayData data[19];
    char stringdata0[180];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_QMVC1000mf_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_QMVC1000mf_t qt_meta_stringdata_QMVC1000mf = {
    {
QT_MOC_LITERAL(0, 0, 10), // "QMVC1000mf"
QT_MOC_LITERAL(1, 11, 13), // "NewImageReady"
QT_MOC_LITERAL(2, 25, 0), // ""
QT_MOC_LITERAL(3, 26, 8), // "cv::Mat&"
QT_MOC_LITERAL(4, 35, 5), // "image"
QT_MOC_LITERAL(5, 41, 10), // "InitCamera"
QT_MOC_LITERAL(6, 52, 2), // "id"
QT_MOC_LITERAL(7, 55, 12), // "UnInitCamera"
QT_MOC_LITERAL(8, 68, 20), // "InitCameraImageParam"
QT_MOC_LITERAL(9, 89, 5), // "ULONG"
QT_MOC_LITERAL(10, 95, 5), // "Width"
QT_MOC_LITERAL(11, 101, 6), // "Height"
QT_MOC_LITERAL(12, 108, 8), // "exposure"
QT_MOC_LITERAL(13, 117, 5), // "UCHAR"
QT_MOC_LITERAL(14, 123, 4), // "gain"
QT_MOC_LITERAL(15, 128, 21), // "SetCameraTriggerDelay"
QT_MOC_LITERAL(16, 150, 4), // "WORD"
QT_MOC_LITERAL(17, 155, 8), // "trgDelay"
QT_MOC_LITERAL(18, 164, 15) // "CaptureOneImage"

    },
    "QMVC1000mf\0NewImageReady\0\0cv::Mat&\0"
    "image\0InitCamera\0id\0UnInitCamera\0"
    "InitCameraImageParam\0ULONG\0Width\0"
    "Height\0exposure\0UCHAR\0gain\0"
    "SetCameraTriggerDelay\0WORD\0trgDelay\0"
    "CaptureOneImage"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_QMVC1000mf[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      10,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   64,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       5,    1,   67,    2, 0x0a /* Public */,
       7,    0,   70,    2, 0x0a /* Public */,
       8,    4,   71,    2, 0x0a /* Public */,
       8,    3,   80,    2, 0x2a /* Public | MethodCloned */,
       8,    2,   87,    2, 0x2a /* Public | MethodCloned */,
       8,    1,   92,    2, 0x2a /* Public | MethodCloned */,
       8,    0,   95,    2, 0x2a /* Public | MethodCloned */,
      15,    1,   96,    2, 0x0a /* Public */,
      18,    0,   99,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    4,

 // slots: parameters
    QMetaType::Bool, QMetaType::Int,    6,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 9, 0x80000000 | 9, 0x80000000 | 9, 0x80000000 | 13,   10,   11,   12,   14,
    QMetaType::Void, 0x80000000 | 9, 0x80000000 | 9, 0x80000000 | 9,   10,   11,   12,
    QMetaType::Void, 0x80000000 | 9, 0x80000000 | 9,   10,   11,
    QMetaType::Void, 0x80000000 | 9,   10,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 16,   17,
    QMetaType::Void,

       0        // eod
};

void QMVC1000mf::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        QMVC1000mf *_t = static_cast<QMVC1000mf *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->NewImageReady((*reinterpret_cast< cv::Mat(*)>(_a[1]))); break;
        case 1: { bool _r = _t->InitCamera((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 2: _t->UnInitCamera(); break;
        case 3: _t->InitCameraImageParam((*reinterpret_cast< ULONG(*)>(_a[1])),(*reinterpret_cast< ULONG(*)>(_a[2])),(*reinterpret_cast< ULONG(*)>(_a[3])),(*reinterpret_cast< UCHAR(*)>(_a[4]))); break;
        case 4: _t->InitCameraImageParam((*reinterpret_cast< ULONG(*)>(_a[1])),(*reinterpret_cast< ULONG(*)>(_a[2])),(*reinterpret_cast< ULONG(*)>(_a[3]))); break;
        case 5: _t->InitCameraImageParam((*reinterpret_cast< ULONG(*)>(_a[1])),(*reinterpret_cast< ULONG(*)>(_a[2]))); break;
        case 6: _t->InitCameraImageParam((*reinterpret_cast< ULONG(*)>(_a[1]))); break;
        case 7: _t->InitCameraImageParam(); break;
        case 8: _t->SetCameraTriggerDelay((*reinterpret_cast< WORD(*)>(_a[1]))); break;
        case 9: _t->CaptureOneImage(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (QMVC1000mf::*_t)(cv::Mat & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&QMVC1000mf::NewImageReady)) {
                *result = 0;
            }
        }
    }
}

const QMetaObject QMVC1000mf::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_QMVC1000mf.data,
      qt_meta_data_QMVC1000mf,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *QMVC1000mf::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *QMVC1000mf::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_QMVC1000mf.stringdata0))
        return static_cast<void*>(const_cast< QMVC1000mf*>(this));
    return QObject::qt_metacast(_clname);
}

int QMVC1000mf::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 10)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 10)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 10;
    }
    return _id;
}

// SIGNAL 0
void QMVC1000mf::NewImageReady(cv::Mat & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
