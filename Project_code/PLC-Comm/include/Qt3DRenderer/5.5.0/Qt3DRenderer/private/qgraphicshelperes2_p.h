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

#ifndef QT3D_RENDER_QGRAPHICSHELPERES2_H
#define QT3D_RENDER_QGRAPHICSHELPERES2_H

#include <Qt3DRenderer/private/qgraphicshelperinterface_p.h>
#include <QOpenGLContext>
#include <QOpenGLFunctions>

QT_BEGIN_NAMESPACE

namespace Qt3D {
namespace Render {

class QGraphicsHelperES2 : public QGraphicsHelperInterface
{
public:
    QGraphicsHelperES2();
    virtual ~QGraphicsHelperES2();

    // QGraphicHelperInterface interface
    void initializeHelper(QOpenGLContext *context, QAbstractOpenGLFunctions *functions) Q_DECL_OVERRIDE;
    void drawElementsInstanced(GLenum primitiveType, GLsizei primitiveCount, GLint indexType, void *indices, GLsizei instances) Q_DECL_OVERRIDE;
    void drawArraysInstanced(GLenum primitiveType, GLint first, GLsizei count, GLsizei instances) Q_DECL_OVERRIDE;
    void drawElements(GLenum primitiveType, GLsizei primitiveCount, GLint indexType, void *indices) Q_DECL_OVERRIDE;
    void drawArrays(GLenum primitiveType, GLint first, GLsizei count) Q_DECL_OVERRIDE;
    void setVerticesPerPatch(GLint verticesPerPatch) Q_DECL_OVERRIDE;
    void useProgram(GLuint programId) Q_DECL_OVERRIDE;
    QVector<ShaderUniform> programUniformsAndLocations(GLuint programId) Q_DECL_OVERRIDE;
    QVector<ShaderAttribute> programAttributesAndLocations(GLuint programId) Q_DECL_OVERRIDE;
    QVector<ShaderUniformBlock> programUniformBlocks(GLuint programId) Q_DECL_OVERRIDE;
    void vertexAttribDivisor(GLuint index, GLuint divisor) Q_DECL_OVERRIDE;
    void blendEquation(GLenum mode) Q_DECL_OVERRIDE;
    void alphaTest(GLenum mode1, GLenum mode2) Q_DECL_OVERRIDE;
    void depthTest(GLenum mode) Q_DECL_OVERRIDE;
    void depthMask(GLenum mode) Q_DECL_OVERRIDE;
    void cullFace(GLenum mode) Q_DECL_OVERRIDE;
    void frontFace(GLenum mode) Q_DECL_OVERRIDE;
    void enableAlphaCoverage() Q_DECL_OVERRIDE;
    void disableAlphaCoverage() Q_DECL_OVERRIDE;
    GLuint createFrameBufferObject() Q_DECL_OVERRIDE;
    void releaseFrameBufferObject(GLuint frameBufferId) Q_DECL_OVERRIDE;
    void bindFrameBufferObject(GLuint frameBufferId) Q_DECL_OVERRIDE;
    GLuint boundFrameBufferObject() Q_DECL_OVERRIDE;
    bool checkFrameBufferComplete() Q_DECL_OVERRIDE;
    void bindFrameBufferAttachment(QOpenGLTexture *texture, const Attachment &attachment) Q_DECL_OVERRIDE;
    bool supportsFeature(Feature feature) const Q_DECL_OVERRIDE;
    void drawBuffers(GLsizei n, const int *bufs) Q_DECL_OVERRIDE;
    void bindFragDataLocation(GLuint shader, const QHash<QString, int> &outputs) Q_DECL_OVERRIDE;
    void bindUniform(const QVariant &v, const ShaderUniform &description) Q_DECL_OVERRIDE;
    void bindUniformBlock(GLuint programId, GLuint uniformBlockIndex, GLuint uniformBlockBinding) Q_DECL_OVERRIDE;
    void bindBufferBase(GLenum target, GLuint index, GLuint buffer) Q_DECL_OVERRIDE;
    void buildUniformBuffer(const QVariant &v, const ShaderUniform &description, QByteArray &buffer) Q_DECL_OVERRIDE;
    uint uniformByteSize(const ShaderUniform &description) Q_DECL_OVERRIDE;

private:
    QOpenGLFunctions *m_funcs;
    bool m_isES3;
};

} // Render
} // Qt3D

QT_END_NAMESPACE

#endif // QT3D_RENDER_QGRAPHICSHELPERES2_H
