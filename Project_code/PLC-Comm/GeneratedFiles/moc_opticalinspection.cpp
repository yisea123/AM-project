/****************************************************************************
** Meta object code from reading C++ file 'opticalinspection.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "stdafx.h"
#include "../../opticalinspection.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'opticalinspection.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_OpticalInspection_t {
    QByteArrayData data[16];
    char stringdata0[144];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_OpticalInspection_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_OpticalInspection_t qt_meta_stringdata_OpticalInspection = {
    {
QT_MOC_LITERAL(0, 0, 17), // "OpticalInspection"
QT_MOC_LITERAL(1, 18, 15), // "CaptureOneImage"
QT_MOC_LITERAL(2, 34, 0), // ""
QT_MOC_LITERAL(3, 35, 9), // "ShowImage"
QT_MOC_LITERAL(4, 45, 8), // "cv::Mat&"
QT_MOC_LITERAL(5, 54, 5), // "image"
QT_MOC_LITERAL(6, 60, 14), // "ShowDifference"
QT_MOC_LITERAL(7, 75, 7), // "cv::Mat"
QT_MOC_LITERAL(8, 83, 6), // "image1"
QT_MOC_LITERAL(9, 90, 6), // "image2"
QT_MOC_LITERAL(10, 97, 8), // "showBase"
QT_MOC_LITERAL(11, 106, 13), // "RegProjective"
QT_MOC_LITERAL(12, 120, 4), // "img1"
QT_MOC_LITERAL(13, 125, 4), // "img2"
QT_MOC_LITERAL(14, 130, 10), // "InitCamera"
QT_MOC_LITERAL(15, 141, 2) // "id"

    },
    "OpticalInspection\0CaptureOneImage\0\0"
    "ShowImage\0cv::Mat&\0image\0ShowDifference\0"
    "cv::Mat\0image1\0image2\0showBase\0"
    "RegProjective\0img1\0img2\0InitCamera\0"
    "id"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_OpticalInspection[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   39,    2, 0x0a /* Public */,
       3,    1,   40,    2, 0x0a /* Public */,
       6,    3,   43,    2, 0x0a /* Public */,
      11,    2,   50,    2, 0x0a /* Public */,
      14,    1,   55,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 4,    5,
    QMetaType::Int, 0x80000000 | 7, 0x80000000 | 7, 0x80000000 | 7,    8,    9,   10,
    0x80000000 | 7, 0x80000000 | 7, 0x80000000 | 7,   12,   13,
    QMetaType::Bool, QMetaType::Int,   15,

       0        // eod
};

void OpticalInspection::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        OpticalInspection *_t = static_cast<OpticalInspection *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->CaptureOneImage(); break;
        case 1: _t->ShowImage((*reinterpret_cast< cv::Mat(*)>(_a[1]))); break;
        case 2: { int _r = _t->ShowDifference((*reinterpret_cast< const cv::Mat(*)>(_a[1])),(*reinterpret_cast< const cv::Mat(*)>(_a[2])),(*reinterpret_cast< const cv::Mat(*)>(_a[3])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 3: { cv::Mat _r = _t->RegProjective((*reinterpret_cast< const cv::Mat(*)>(_a[1])),(*reinterpret_cast< const cv::Mat(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< cv::Mat*>(_a[0]) = _r; }  break;
        case 4: { bool _r = _t->InitCamera((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        default: ;
        }
    }
}

const QMetaObject OpticalInspection::staticMetaObject = {
    { &QWidget::staticMetaObject, qt_meta_stringdata_OpticalInspection.data,
      qt_meta_data_OpticalInspection,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *OpticalInspection::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *OpticalInspection::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_OpticalInspection.stringdata0))
        return static_cast<void*>(const_cast< OpticalInspection*>(this));
    return QWidget::qt_metacast(_clname);
}

int OpticalInspection::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
