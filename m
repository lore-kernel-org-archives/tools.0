Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.3117.1599036936047618717
 for <tools@linux.kernel.org>;
 Wed, 02 Sep 2020 01:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: k.kozlowski.k@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id m22so5492952eje.10
        for <tools@linux.kernel.org>; Wed, 02 Sep 2020 01:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=0mNGwv30hJUpmNIANUAB2nzLZTm4je420wfemluOonY=;
        b=GSpfH4sfiBOC22gyQrtUnqgyLIcy/udrWAzypHOZ2IH17JUibFr165Bx97MqFCAVPZ
         KtgGiYQrcDrVE+aWG9dTBF+1ni3dRBQDvHfALN3uGlxHtuR7/d/7zdM5FcReDSvLNqXa
         PNZBgqYBB/lTE4FkB+lgMjSG/Vt1Br1DYen4Zzz3jZAsui3sDP1xTnRPUD+UnNFypK/f
         xunCbxR50cofyuofyHfyalF5FdNxS1+OWZqOOZ0BsJ4j83np0NukPDkIvSp/+Ie6xEkM
         8bhw5wWD5pFG5n9W2Gr5cF8qkKw5Pewzmhcn8/gVFo0+rdKMoF7mEm5C/Eb5eFmMBgBH
         91JQ==
X-Gm-Message-State: AOAM531tGwoBewBt7qlvIdPabsutfUnPIpmGUw+dDz+7LL/zNi1iWGVD
	m4fOksCLyp3ngPvl7jWrbdbpv0w+SOGLBg==
X-Google-Smtp-Source: ABdhPJzZsIPt6pXP9XdZ8hRGokD7Vl3zdRjSso+ee0QSfQM9AzDPuv/Pd/ZGX8HQXFkVOHYdRKY7pw==
X-Received: by 2002:a17:906:a4b:: with SMTP id x11mr5630870ejf.83.1599036934244;
        Wed, 02 Sep 2020 01:55:34 -0700 (PDT)
Return-Path: <k.kozlowski.k@gmail.com>
Received: from pi3 ([194.230.155.106])
        by smtp.googlemail.com with ESMTPSA id g11sm3469672edt.88.2020.09.02.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 01:55:33 -0700 (PDT)
Date: Wed, 2 Sep 2020 10:55:31 +0200
From: "Krzysztof Kozlowski" <krzk@kernel.org>
To: tools@linux.kernel.org
Cc: mricon@kernel.org
Subject: b4-am SyntaxError on Python 3.5
Message-ID: <20200902085531.GA13726@pi3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

I tried now b4 v0.5.2 on my Ubuntu 16.04 with Python 3.5 and:

  $ b4
  Traceback (most recent call last):
    File "/home/krzk/.local/bin/b4", line 7, in <module>
      from b4.command import cmd
    File "/home/krzk/.local/lib/python3.5/site-packages/b4/__init__.py", line 625
      ecode, out = git_run_command(gitdir, ['show', f'{when}:{fn}'])
                                                                 ^
  SyntaxError: invalid syntax

Is Python v3.5 not supported by b4?

Best regards,
Krzysztof
