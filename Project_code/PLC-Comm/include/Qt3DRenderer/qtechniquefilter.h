/****************************************************************************
**
** Copyright (C) 2014 Klaralvdalens Datakonsult AB (KDAB).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt3D module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef QT3D_QTECHNIQUEFILTER_H
#define QT3D_QTECHNIQUEFILTER_H

#include <Qt3DRenderer/qt3drenderer_global.h>
#include <Qt3DRenderer/qframegraphnode.h>

QT_BEGIN_NAMESPACE

namespace Qt3D {

class QTechniqueFilterPrivate;
class QAnnotation;
class QParameter;

class QT3DRENDERERSHARED_EXPORT QTechniqueFilter : public QFrameGraphNode
{
    Q_OBJECT
public:
    explicit QTechniqueFilter(QNode *parent = 0);

    QList<QAnnotation *> criteria() const;
    void addRequirement(QAnnotation *criterion);
    void removeRequirement(QAnnotation *criterion);

    void addParameter(QParameter *p);
    void removeParameter(QParameter *p);
    QList<QParameter *> parameters() const;

protected:
    QTechniqueFilter(QTechniqueFilterPrivate &dd, QNode *parent = 0);
    void copy(const QNode *ref) Q_DECL_OVERRIDE;

private:
    Q_DECLARE_PRIVATE(QTechniqueFilter)
    QT3D_CLONEABLE(QTechniqueFilter)
};

} // namespace Qt3D

QT_END_NAMESPACE

#endif // QT3D_QTECHNIQUEFILTER_H
