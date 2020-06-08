Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.1286.1591647212341667519
 for <tools@linux.kernel.org>;
 Mon, 08 Jun 2020 13:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dmRT/NBn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.170, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f170.google.com with SMTP id n11so18623973qkn.8
        for <tools@linux.kernel.org>; Mon, 08 Jun 2020 13:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=HdWZPLzRZGn8tNICJFxHjG3Pi/plNmtuxNBSAY88qug=;
        b=dmRT/NBnQKvnAcLuU+eyO7aZGXN//DRaozFXDGyr9vLbhNn/DhBo1eWAkHSvfqGW6B
         9PIs2Y3l7jRuAiBG1T/Wn/J6nopwgiSqyKZmM08d6zLauYEBK7wJ0CWMqZPxOyitwyCr
         Wz9f+YDs5w+iPmZh+Cldkjefs0X8Klf90U+vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=HdWZPLzRZGn8tNICJFxHjG3Pi/plNmtuxNBSAY88qug=;
        b=LNME6c7lLOMaM/Xv8KbcceCWybduTruYA8Ta2UBoOKb4Kc++q3rd8qEaUweeYikgIN
         DaXjOioOKpTZITHESATFVmeYvPJoima0cvhsCsJqxjan06lrwZHR1QrhchT/DbWG9Roq
         104tezTH7NEG28jRFpm88eZENpcsFjOCuYNors7gyFl50N5f9cBvCPXmRk4ho8Yy0Q8c
         aVT3bvwRF+dJXecqWnPETysLqB+FKfrJoof+0Suthy5UvOzMf0uR1GN6rQTWnBQYXnPy
         CfbZL8+UaUuUIOECLNuCIgyljyEMnVbdyQByg3EosCO8g4pp8p5TTojQfiZLwoAWs1fx
         a2eQ==
X-Gm-Message-State: AOAM532rFm1hZ226aHuk3KMn3+jirR7AcJB8cyHx+TSJCDZeJhQhcDJN
	0W4pfDmhbW5p7URpceIOUNciDw==
X-Google-Smtp-Source: ABdhPJwGm99AVkuaXQ4F6PpgVMRS09vy8MuDauP+GPdE6u6uVgJezPKKJeRn9eyJtovAPgZl6PO8FQ==
X-Received: by 2002:a37:aa92:: with SMTP id t140mr23873917qke.145.1591647211409;
        Mon, 08 Jun 2020 13:13:31 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id l2sm9428110qtc.80.2020.06.08.13.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 13:13:30 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Mon, 08 Jun 2020 16:13:29 -0400
Date: Mon, 8 Jun 2020 16:13:29 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 v0.5.1 available with bugfixes and small feature additions
Message-ID: <20200608201329.3a7uade7u2ckrdnr@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

I am pleased to release b4 version 0.5.1 with the following changes:

- add "--no-cover" and "-o -" flags to "b4 am" that allow piping "b4 am"
  output straight to "git am"
- small bugfixes and improvements

You can install the updated version by running:

pip install --upgrade --user b4

or run it straight from git, as usual, using stable-0.5.y branch.

The following people contributed to this release via their feedback:

- Mark Brown <broonie@kernel.org>
- Rob Herring <robh@kernel.org>
- Maxime Ripard <maxime@cerno.tech>
- Linus Torvalds <torvalds@linux-foundation.org>
- Michael S. Tsirkin <mst@redhat.com>

Thanks!

-K
