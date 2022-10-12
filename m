Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF210612F
	for <tools@linux.kernel.org>; Wed, 12 Oct 2022 23:04:30 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id c24so230660pls.9
        for <tools@linux.kernel.org>; Wed, 12 Oct 2022 16:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx5Ur4EnXWwHa31eZTHv/UsoGVlZUyx80aW7q37HmmI=;
        b=2KYqbIj9j1/K95aoq0/VPJE5CXfxONXqqd4SpJGlDQ0G69fmtGRSzvXtN8PtoMnqOn
         sDXkbBopnnLInS+nCkVWdhMosaBcWvtUMhSas6NP3Q1FbfA8T16Rxnl93pFxw2qK3T3S
         46z/3ZqFYlDrgqG+K7ysBzR+d2wTj8hYxkqAvwWwj5wQGNJksnXBWrmtVLnJYp1oja9N
         Gg//KLzpk3YB2k1GM02RttSgSvMzIsmTNJ4Un9M5CDkxrlyJDgFA4LzVfweDYl9CUgdI
         Un57/DGy7owAU/8BhZRGDmKhBupqczvG7F8y0oI2jV+ieupfkAT2NDu3tlwugeecK5uY
         whyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sx5Ur4EnXWwHa31eZTHv/UsoGVlZUyx80aW7q37HmmI=;
        b=jydeSPwG/f5kSOgb64aYIXxcJ0z0VZfJeVoS41jBQ9Z1bTXfd1n0kx7YY/Qa97SKbu
         kpsHchRrD/Zzx46RMoKcnZ2qrmZXeG3tG5YLtlVLR1plZj2d8UI2MwFc6c2crvKBsxsX
         d6jxovPw5ADqvLVopau0MInxBTY51K/0DMqoZCMkt0j9nC12OWMyIPxXfgRitj251mEg
         6g8IIdgXCQrngjVyimfUQbwLZ0iLXa2Ej6VvaLnnAWrWUfTHokmuMxc12ei1AFP/0ru3
         22xsfLoLPz1Ukhrf8naz2Y79yyrCs9b+13oQe32TGLP4EZyeMmyyHgaVj4eOv78Mu7Ic
         K0pw==
X-Gm-Message-State: ACrzQf0JTJgSPjNv4xsFF9HRJFGciSaUHRDwCDp+8k/QfykuE7hhcN9l
	vPDB4jbjDI9jakyawjcwo13t5YYA8fS74g==
X-Google-Smtp-Source: AMsMyM79Ww0FI/cLJroCQH9UfldsIAPo8IROEwaFnAw6Y/488zGi2RYyi3LIsGzb+pONa4Woa2OHIw==
X-Received: by 2002:a17:90b:1e0b:b0:20d:7ddf:9b08 with SMTP id pg11-20020a17090b1e0b00b0020d7ddf9b08mr7634806pjb.187.1665615870091;
        Wed, 12 Oct 2022 16:04:30 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id x9-20020a170902a38900b0017f9db0236asm11150442pla.82.2022.10.12.16.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 16:04:29 -0700 (PDT)
Subject: [PATCH] Add a doc for contributors
Date: Wed, 12 Oct 2022 16:01:21 -0700
Message-Id: <20221012230121.29033-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To:          tools@linux.kernel.org

No idea if this is accurate, but I'm trying to send some patches and
didn't find anything else documenting how to do so.  I'm following my
own guide to see how accurate it is...

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 CONTRIBUTING.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 CONTRIBUTING.rst

diff --git a/CONTRIBUTING.rst b/CONTRIBUTING.rst
new file mode 100644
index 0000000..9089da7
--- /dev/null
+++ b/CONTRIBUTING.rst
@@ -0,0 +1,10 @@
+Submitting Patches to b4
+========================
+
+The current b4 source code can be found at::
+
+  git clone https://git.kernel.org/pub/scm/utils/b4/b4.git/
+
+patches can be sent to::
+
+  tools@linux.kernel.org
-- 
2.38.0

