Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web08.5761.1605194502334985188
 for <tools@linux.kernel.org>;
 Thu, 12 Nov 2020 07:21:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W1XiHWLu;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: levraiphilippeblain@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id z17so2883003qvy.11
        for <tools@linux.kernel.org>; Thu, 12 Nov 2020 07:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rLoRbw6eDiHMW2W9toZMvy9lX+uinXK6pCIIL/2CVjg=;
        b=W1XiHWLuxKozUET0ygEJaDOYlG9WF0cyeEib+9/8Zxn+1Kj3gnuIQuHclS/ccCfbzm
         cJZ8F9n0XbvwnbUBja7icLNPy9g7zq/2tLrUATygvVH7keXXYUtr8goLzvFfr2Be1bC8
         B8IOc7t4gbJPxoigx5qNYlKSp6E371fSGfE5/24Xw/A/g6nF2CS1o7qia7EAbuy/uSx6
         HZ9hiSdzQgMJooJnrl6tWjusEIPms3yiocy785NlNyTlIzo5lbcy9ZODrAdN2NOkZteS
         cI1qJyyWhANsTUkX2M7rPlEjSRqmzl6h/mcopC5+0TLUkvi5p0NQEL5Rtq4nwjFP08t7
         Pm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rLoRbw6eDiHMW2W9toZMvy9lX+uinXK6pCIIL/2CVjg=;
        b=jhLu55EZI96yqrcIP44AgVKAN0Uy9YmTRWzgF7yv6lAnYw8SAjfQdEGqshLBIvN1kV
         1oLUifbZYvUe9cKGPclJwuyiHM7fJ6I/z0S7cnFxPntg8u/1mnQs0y2AuA2RtO8nOonq
         +NC00PtgUx81lWulIh4ZEm95vEyHBub40QOTZHnPdZGB7/DNQJt3ZPwij6a0MSeq4Ldc
         lvH+Gbrgncnto1TrQVNvcoNeUYs2ztS19YQSt9thi+F3s2eocrgziJreHDze+pXcRIKE
         fgokD+wfei3jc5+bh/2ViFvy9lqT3Ey/6mziZ+gGei9/PjvMkbIyVP0M/QleMOzFCccZ
         wBVg==
X-Gm-Message-State: AOAM530Pvbdlslk3B7blCgNaUYczFK29FtUTcH/T7UHW5QL7J8LfHSpx
	oFOhyeA4gPP6HHcGp6+LIiJo4zoTQLZIIA==
X-Google-Smtp-Source: ABdhPJzhjPVTenu0otSSRcY0Xah3oolSWHT229Je7J0Olik60oKXoTMIfE9BJbPxo9IWPf60kqJA6w==
X-Received: by 2002:a0c:b98f:: with SMTP id v15mr31200579qvf.51.1605194501115;
        Thu, 12 Nov 2020 07:21:41 -0800 (PST)
Return-Path: <levraiphilippeblain@gmail.com>
Received: from localhost.localdomain ([192.222.216.4])
        by smtp.gmail.com with ESMTPSA id k70sm5230351qke.46.2020.11.12.07.21.40
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Nov 2020 07:21:40 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org
Subject: [PATCH b4 4/4] Distribute the manpage with the pip package
Date: Thu, 12 Nov 2020 10:21:34 -0500
Message-Id: <20201112152134.96498-5-levraiphilippeblain@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201112152134.96498-1-levraiphilippeblain@gmail.com>
References: <20201112152134.96498-1-levraiphilippeblain@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'data_files' option to setuptools.setup can be used to install
additional files "outside" of the package [1].

Use it so that the manpage is installed with the package.

Install the manpage to '$PREFIX/share/man/man5', mimicking what the
Filesystem Hiararchy Standard mandates for the '/usr/local/' prefix [2].

Prefer '$PREFIX/share/man/man5' to '$PREFIX/man/man5' since the later is
deprecated [3].

[1] https://docs.python.org/3/distutils/setupscript.html#installing-additional-files
[2] https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch04s11.html#idm236091648080
[3] https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch04s11.html#ftn.idm236091648080

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---

Notes:
    A small note: by installing the man page to '$PREFIX/share/man', we are
    unfortunately trusting every other package installed in '$PREFIX' to follow
    the same convention.
    
    The reason is that when invoking `man <cmd>`, man(1) looks for the <cmd> man
    page by searching for man directories "near" the directory where <cmd> is found
    in 'PATH'. This search is limited to a single "nearby" directory and at least
    for some versions of man on some Linux distributions [1], '$PREFIX/man' is
    preferred to '$PREFIX/share/man'.
    
    So if manpages exist in both locations, man will only look in '$PREFIX/man' and
    our manpage won't be found. The behavior of man(1) on macOS is the opposite;
    the search prefers '$PREFIX/share/man' to '$PREFIX/man' [2].
    
    We could install the man page at both locations, but then we are wasting disk
    space (does it matter?). We can't easily use a symlink from one location to the
    other one, because this is not well supported by pip/setuptools [3].
    
    [1] https://github.com/conda-forge/git-feedstock/pull/65#discussion_r322762265
    [2] https://github.com/conda-forge/git-feedstock/issues/66#issuecomment-539095424
    [3] https://github.com/pypa/pip/issues/5856

 setup.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/setup.py b/setup.py
index 65ede59..867b5cf 100644
--- a/setup.py
+++ b/setup.py
@@ -38,6 +38,7 @@ setup(
     license='GPLv2+',
     long_description=read('man/b4.5.rst'),
     long_description_content_type='text/x-rst',
+    data_files = [('share/man/man5', ['man/b4.5'])],
     keywords=['git', 'lore.kernel.org', 'patches'],
     install_requires=[
         'requests'
-- 
2.27.0

