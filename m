Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436152F2D
	for <tools@linux.kernel.org>; Thu, 22 Sep 2022 11:37:52 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id h3so10653841lja.1
        for <tools@linux.kernel.org>; Thu, 22 Sep 2022 04:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:mime-version:user-agent:from:from:to:cc
         :subject:date;
        bh=mEu4V4gXz7ujA4wHBZmPPhna+dLPp4U+IcOtKwiQocI=;
        b=JTE4moEXdPCmBIqxXKtBx+u+MOVO3OybhtiX5eMfcTaK/zSUbhpP6ghX1ivd5Ax4IS
         iap0LDcwTFB0Tk4EcDIdHsBLy0bt1/1d6VHZQLtup2UE2kcaLnPVdauEXCzL+lCj32H6
         H6XJdFsmCg6/lRC+tRHcCzOD2sMw7P6/o88I4+1I0HiyMozOx0sw8KsM85pdi97QjK1y
         vtnYsuXN6n7ISlVg69svfELkV4E84S/jxduxkLR+hWFbUn/N5OOYI+Ap3rsSIYuKayiE
         7mRNeLv8WuQERu1XNDbPU/V/QYXhOBjGEV7xT19Nj8xnehWdKLVjlKmtzvNDnJ14SzOn
         ROpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:mime-version:user-agent:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=mEu4V4gXz7ujA4wHBZmPPhna+dLPp4U+IcOtKwiQocI=;
        b=tf+gfW5C5WicaGTWw99TizgoEMDbKXPsyumNaoBcBnGQ/d7f23/FXu7/RQafHim/gR
         CqoH/QNEqCHDXbI9krORhcvlYTViDbu5mKVgv6hvfV+kfIqeYKGZhVw0qXFn+wZ9Y9px
         XishPzLUHbLGnTDSdvZbfFtQ3ek+Pi1g9NYzBgwQQ9i9KdPMm6eqHt7fFp5FIL0Q31nL
         jmcDWa0VKMIEQEmaKB05dDgnIqSCBc/82uecon/tUCHsvfa01TQfwkSofgw8mBZin0u0
         0xWsdvsPGpT14ss22t2Ff0WQXCVjXTfbuVspgu9CblPwNPX985lo8VmiJR+eHXsR+EBN
         vQXg==
X-Gm-Message-State: ACrzQf17trFhYrzOrCldzx5rfnBpR0n+yqfJMfTwT6Q9fs8n0/tjyptX
	FNF5PzEATX9tH8hKtCcVf2NSVFYtmnVc24nNIZNjzobDrO8=
X-Google-Smtp-Source: AMsMyM4rTPgbS4d0UU4nx8P8Tk/EwN6kN6N9oEVv/PIZ4WdP2iYOk2w0+Kj+3KXMbcREw+w7ZCCJFnwAHZrklFw/OPE=
X-Received: by 2002:a2e:3112:0:b0:24f:132a:fd71 with SMTP id
 x18-20020a2e3112000000b0024f132afd71mr914959ljx.522.1663846668044; Thu, 22
 Sep 2022 04:37:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Sep 2022 04:37:44 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Sep 2022 04:37:44 -0700
Message-ID: <CABnWg9uBOGqJMq=yCtn7SoEME=+2u1-ZK9ftb6=_jRhkhL_jiw@mail.gmail.com>
Subject: b4 send: missing diffstat in individual patches
To: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I've recently sent a patch series with b4 and diffstats are missing
from individual patches.

Which in itself is not an issue as I understand this is only comments
that are irrelevant to
the patch itself.

Though, I've had some complaints that my patches looks broken...
people seem to expect the
diffstat to be present.

The serie was sent with 0.10.0-dev (master from some weeks ago).
I've just retried a dry-run with the latest and the diffstat is still missing.

I haven't seen any option in b4 send to produce the individual commit
diffstat, I will have
a quick look if I can propose a patch.

Thx,
Guillaume.
