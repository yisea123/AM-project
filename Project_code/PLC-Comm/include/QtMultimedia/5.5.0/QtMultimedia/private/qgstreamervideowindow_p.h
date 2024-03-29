/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL21$
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
** General Public License version 2.1 or version 3 as published by the Free
** Software Foundation and appearing in the file LICENSE.LGPLv21 and
** LICENSE.LGPLv3 included in the packaging of this file. Please review the
** following information to ensure the GNU Lesser General Public License
** requirements will be met: https://www.gnu.org/licenses/lgpl.html and
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** As a special exception, The Qt Company gives you certain additional
** rights. These rights are described in The Qt Company LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef QGSTREAMERVIDEOWINDOW_H
#define QGSTREAMERVIDEOWINDOW_H

#include <qvideowindowcontrol.h>

#include "qgstreamervideorendererinterface_p.h"
#include <private/qgstreamerbushelper_p.h>
#include <private/qgstreamerbufferprobe_p.h>
#include <QtGui/qcolor.h>

QT_BEGIN_NAMESPACE
class QAbstractVideoSurface;

class QGstreamerVideoWindow : public QVideoWindowControl,
        public QGstreamerVideoRendererInterface,
        public QGstreamerSyncMessageFilter,
        private QGstreamerBufferProbe
{
    Q_OBJECT
    Q_INTERFACES(QGstreamerVideoRendererInterface QGstreamerSyncMessageFilter)
    Q_PROPERTY(QColor colorKey READ colorKey WRITE setColorKey)
    Q_PROPERTY(bool autopaintColorKey READ autopaintColorKey WRITE setAutopaintColorKey)
public:
    QGstreamerVideoWindow(QObject *parent = 0, const char *elementName = 0);
    ~QGstreamerVideoWindow();

    WId winId() const;
    void setWinId(WId id);

    QRect displayRect() const;
    void setDisplayRect(const QRect &rect);

    bool isFullScreen() const;
    void setFullScreen(bool fullScreen);

    QSize nativeSize() const;

    Qt::AspectRatioMode aspectRatioMode() const;
    void setAspectRatioMode(Qt::AspectRatioMode mode);

    QColor colorKey() const;
    void setColorKey(const QColor &);

    bool autopaintColorKey() const;
    void setAutopaintColorKey(bool);

    void repaint();

    int brightness() const;
    void setBrightness(int brightness);

    int contrast() const;
    void setContrast(int contrast);

    int hue() const;
    void setHue(int hue);

    int saturation() const;
    void setSaturation(int saturation);

    QAbstractVideoSurface *surface() const;

    GstElement *videoSink();

    bool processSyncMessage(const QGstreamerMessage &message);
    bool isReady() const { return m_windowId != 0; }

signals:
    void sinkChanged();
    void readyChanged(bool);

private slots:
    void updateNativeVideoSize(const QSize &size);

private:
    void probeCaps(GstCaps *caps);

    GstElement *m_videoSink;
    WId m_windowId;
    Qt::AspectRatioMode m_aspectRatioMode;
    QRect m_displayRect;
    bool m_fullScreen;
    QSize m_nativeSize;
    mutable QColor m_colorKey;
};

QT_END_NAMESPACE

#endif
